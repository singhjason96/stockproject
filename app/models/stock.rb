class Stock < ApplicationRecord
    belongs_to :user
    validate :ticker_exists

    def ticker_exists
        #call api to make sure ticker exists
        begin 
          @quote = IEX::Resources::Quote.get(ticker)
          stop_is_less_than_price(@quote)
        rescue 
            errors.add(:ticker, "is not valid")
        end

    end

    def stop_is_less_than_price(quote)
        #call api to make sure stop is less than price
        if quote.latest_price < stop
            errors.add(:stop, "is more than current price of stock: $#{quote.latest_price}")
        end

    end
end
