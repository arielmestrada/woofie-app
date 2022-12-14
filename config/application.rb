require_relative 'boot'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FinalProject
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.x.dogapi.token = 'live_lGUCFnfKqblVf6mwWy7adVyXQj4guRrXtYvctbtlc1A1mAjVc35gMfUfZOEzyaQp'
    config.x.base_uri = 'api.thedogapi.com/v1'
    config.x.pusher = ENV['PUSHER_KEY']
    config.x.pusher_id = ENV['PUSHER_APP_ID']
    config.x.pusher_app_key = ENV['PUSHER_APP_KEY']
    config.x.pusher_secret = ENV['PUSHER_SECRET']
  end
end
