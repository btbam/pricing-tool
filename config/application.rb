require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

if File.exist?(File.expand_path('../app.yml', __FILE__))
  config = YAML.load(File.read(File.expand_path('../app.yml', __FILE__)))
  config.merge! config.fetch(Rails.env, {})
  config.each do |key, value|
    ENV[key] ||= value.to_s unless value.is_a? Hash
  end
end

module FinancialLines
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified
    # here. Application configuration should go into files in
    # config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record
    # auto-convert to this zone. Run "rake -D time" for a list of tasks for
    # finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from
    # config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[
    #   Rails.root.join('my', 'locales', '*.{rb,yml}').to_s
    # ]
    # config.i18n.default_locale = :de

    # disable assets pipeline
    config.assets.enabled = false
    config.generators.assets = false

    config.middleware.insert_before 0, 'Rack::Cors' do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :options]
      end
    end

    # TODO: refactor this section
    config.pricing-tool = ActiveSupport::OrderedOptions.new

    # defaults to true in development, false otherwise
    news_demo = "#{ENV['pricing-tool_NEWS_DEMO']}"
    if Rails.env.development?
      config.pricing-tool.news_demo = true unless news_demo == '0' || news_demo.downcase == 'false'
    else
      config.pricing-tool.news_demo = false unless news_demo == '1' || news_demo.downcase == 'true'
    end

    # defaults to true in development, false otherwise
    comparables_demo = "#{ENV['pricing-tool_COMPARABLES_DEMO']}"
    if Rails.env.development?
      config.pricing-tool.comparables_demo = true unless comparables_demo == '0' || comparables_demo.downcase == 'false'
    else
      config.pricing-tool.comparables_demo = false unless comparables_demo == '1' || comparables_demo.downcase == 'true'
    end
  end
end
