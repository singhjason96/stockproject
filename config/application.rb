require_relative 'boot'
require 'rails/all'
require 'news-api'
require 'twilio-ruby'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module StockProject
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end


#@quote = IEX::Resources::Quote.get('#{@stock.ticker}')
#p @quote.open
#p @quote.iex_realtime_price
#p @quote.latest_price







