require 'RMagick'
include Magick
namespace :report_e2e do
  desc 'run'
  task run: :environment do
    p 'E2Eレポート'
    reports = {}
    branch_name = ENV['CIRCLE_BRANCH'] || 'default'
    current_build_num = (ENV['CIRCLE_BUILD_NUM'] || 0).to_i
    before_build_num = 0
    before_build_files = []
    s3 = Aws::S3::Client.new
    resp = s3.list_objects(bucket: ENV['E2E_REPORT_BUCKET'], prefix: "#{branch_name}/#{current_build_num}/screenshot/")
    current_build_files = resp.contents.map { |object| object.key.to_s }
    current_build_num.downto(1) do |build_num|
      resp = s3.list_objects(bucket: ENV['E2E_REPORT_BUCKET'], prefix: "#{branch_name}/#{build_num}/screenshot/")
      before_build_files = resp.contents.map { |object| object.key.to_s }
      unless before_build_files.empty?
        before_build_num = build_num
        break
      end
    end

    current_build_files.each do |current_file_path|
      identifier = File.basename(current_file_path, '.png')
      current_image_file = s3.get_object(bucket: ENV['E2E_REPORT_BUCKET'], key: "#{branch_name}/#{current_build_num}/screenshot/#{identifier}.png")
      f = open('current_image.png', 'wb')
      f.write(current_image_file.body.read)
      f.close
      begin
        before_image_file = s3.get_object(bucket: ENV['E2E_REPORT_BUCKET'], key: "#{branch_name}/#{before_build_num}/screenshot/#{identifier}.png")
        f = open('before_image.png', 'wb')
        f.write(before_image_file.body.read)
        f.close
      rescue
        next
      end

      current = Image.read('before.png')[0]
      before = Image.read('current.png')[0]
      diff_image = current.composite(before, Magick::NorthWestGravity, Magick::DifferenceCompositeOp)
      diff_image.write('diff_image.png')
      report = {}
      diff = current.difference before
      report[:difference] = {
        mean_error_per_pixel: diff[0],
        normalized_mean_error: diff[1],
        normalized_maximum_error: diff[2]
      }
      reports[identifier] = report
      s3.put_object(
        bucket: 'e2e-report',
        body: File.open('diff_image.png'),
        key: "#{branch_name}/#{current_build_num}/#{identifier}_diff.png"
      )
    end

    s3.put_object(
      bucket: 'e2e-report',
      body: reports.to_yaml,
      key: "#{branch_name}/#{current_build_num}/report.yml"
    )
  end
end
