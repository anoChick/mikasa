class SearchLogJob < ActiveJob::Base
  queue_as :default
  rescue_from ActiveJob::DeserializationError do |ex|
    Shoryuken.logger.error ex
    Shoryuken.logger.error ex.backtrace.join("\n")
  end

  def perform(arg)
  end
end
