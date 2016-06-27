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

      begin
        before_image_file = s3.get_object(bucket: ENV['E2E_REPORT_BUCKET'], key: "#{branch_name}/#{before_build_num}/screenshot/#{identifier}.png")

      rescue
        next
      end

      current = Image.from_blob(current_image_file.body.read)[0]
      before = Image.from_blob(before_image_file.body.read)[0]
      diff_image = current.composite(before, Magick::NorthWestGravity, Magick::DifferenceCompositeOp)
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
        body: diff_image.to_blob,
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
