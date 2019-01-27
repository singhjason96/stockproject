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


@quote = IEX::Resources::Quote.get('XPO')
p @quote.open
p @quote.iex_realtime_price
p @quote.latest_price

# p @n = News.new("0724762104274b33b676ea01c88ccef5")
# p @n.get_top_headlines(sources: "bbc-news")


account_sid = "ACe89054f9f9aacfdfe4d21134a456f244"
auth_token = "b7ed292830a2301be1f9c4c8051c60a8"

@client = Twilio::REST::Client.new(account_sid, auth_token)

# message = @client.messages.create(
#   body: @quote.latest_price,
#   to: "+13479811587",
#   from: "+19083565998"
# )


