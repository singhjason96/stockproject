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
        account_sid = "ACe89054f9f9aacfdfe4d21134a456f244"
        auth_token = "b7ed292830a2301be1f9c4c8051c60a8"
        @message = "Hey  #{stock.ticker} just hit #{live_price} which is under #{stock.stop}"
        @client = Twilio::REST::Client.new(account_sid, auth_token)

        message = @client.messages.create(
        body: @message,
        to: "+13479811587",
        from: "+19083565998"
        )
    end


end
