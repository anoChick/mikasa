def upload_evidence_image(ssid)
  file_name = "#{ssid}.png"
  file_path = page.save_screenshot(file_name, full: true)
  s3 = Aws::S3::Client.new
  branch_name = ENV['CIRCLE_BRANCH'] || 'default'
  build_num = ENV['CIRCLE_BUILD_NUM'] || '0'
  s3.put_object(
    bucket: 'e2e-report',
    body: File.open(file_path),
    key: "#{branch_name}/#{build_num}/screenshot/#{file_name}"
  )
end
