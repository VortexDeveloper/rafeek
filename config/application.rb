require_relative 'boot'
# require_relative '../lib/errors/rafeek_errors.rb'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rafeek
  class Application < Rails::Application
    config.active_job.queue_adapter = :sidekiq
    # config.active_record.default_timezone = :local
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.time_zone = 'Brasilia'
  end
end
