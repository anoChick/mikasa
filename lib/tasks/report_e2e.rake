namespace :report_e2e do
  desc 'run'
  task run: :environment do
    p 'E2Eレポート'
    # branch_name = 'master'
    # current_build_num = 7
    # before_build_num = 0
    # current_build_files = []
    # before_build_files = []
    # s3 = Aws::S3::Client.new
    # resp = s3.list_objects(bucket: ENV['E2E_REPORT_BUCKET'], prefix: "#{branch_name}/#{current_build_num}/")
    # current_build_files = resp.contents.map { |object| object.key.to_s }
    # current_build_num.downto(1) do |build_num|
    #   resp = s3.list_objects(bucket: ENV['E2E_REPORT_BUCKET'], prefix: "#{branch_name}/#{build_num}/")
    #   before_build_files = resp.contents.map { |object| object.key.to_s }
    #   unless before_build_files.empty?
    #     before_build_num = build_num
    #     break
    #   end
    # end
    #
    # f = open('current.png', 'wb')
    # f.write(s3.get_object(bucket: ENV['E2E_REPORT_BUCKET'], key: 'master/7/ID0001.png').body.read)     # 出力は16進数で　CD D8 00 FF
    # f.close
    # f = open('before.png', 'wb')
    # f.write(s3.get_object(bucket: ENV['E2E_REPORT_BUCKET'], key: 'master/7/ID0001.png').body.read)     # 出力は16進数で　CD D8 00 FF
    # f.close

    # p ENV
    # build_num = 7
    # "#{build_num}/#{file_name}"
    #
    # result_json = .body.read
  end
end
