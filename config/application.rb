# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Workshop
  class Application < Rails::Application
    # Provides an HTML generator for displaying errors that come from Active Model
    config.action_view.field_error_proc = proc do |html_tag, _instance|
      raw Nokogiri::HTML.fragment(html_tag).child.add_class('is-invalid')
    end
    config.active_job.queue_adapter = :sidekiq
    config.application_name = Rails.application.class.module_parent_name
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.generators do |g|
    g.orm             :active_record
    g.template_engine :erb
    g.test_framework  :rspec, fixture: false
    g.fixture_replacement :factory_bot, dir: 'spec/factories'
    g.stylesheets     false
    g.javascripts     false
    g.helper          false
    g.system_tests    nil
    end
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
