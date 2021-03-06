require File.expand_path('../boot', __FILE__)

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Mikasa
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.autoload_paths += %W(#{config.root}/app/services)
    config.i18n.default_locale = :ja
    config.active_record.raise_in_transactional_callbacks = true

    config.generators.template_engine = :slim
    config.autoload_paths += %W(#{config.root}/lib)
    config.active_job.queue_adapter     = :shoryuken
    config.active_job.queue_name_prefix = "mikasa_#{Rails.env}"
  end
end
