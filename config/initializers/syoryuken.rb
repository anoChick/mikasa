Shoryuken.configure_server do |config|
  Rails.logger = Shoryuken::Logging.logger
  Shoryuken.active_job_queue_name_prefixing = true
end
