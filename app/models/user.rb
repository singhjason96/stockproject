class User < ApplicationRecord
    has_many :stocks    
    has_secure_password
    def self.global_stock_update
        @users = User.all
        @users.each do |user|
            user.stocks.each do |stock|
               @live_price = IEX::Resources::Price.get(stock.ticker)
               if @live_price <= stock.stop 
                user.stop_alert(@live_price, stock)
               end

            end

        end
    end
    
    def stop_alert(live_price, stock)
        p "alerted #{username} of stock stop
        #{stock.ticker} just hit #{live_price} which is under #{stock.stop}"
        account_sid = ENV["TWILIO_ACCOUNT_SID"]
        auth_token = ENV["TWILIO_AUTH_TOKEN"]
        @message = "Hey  #{stock.ticker} just hit #{live_price} which is under #{stock.stop}"
        @client = Twilio::REST::Client.new(account_sid, auth_token)

        message = @client.messages.create(
        body: @message,
        to: "+13479811587",
        from: "+19083565998"
        )
    end


end
