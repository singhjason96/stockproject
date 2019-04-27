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

    def live_price
        IEX::Resources::Price.get(ticker)
    end

    def stock_logo
        logo = IEX::Resources::Logo.get(ticker)
    end

    def latest_news
        news = IEX::Resources::News.get(ticker,5)
        news.size
        latest = news.first
        latest.headline
        # latest = news.first
        # latest.headline
       
    end
    
    def news_url
        news = IEX::Resources::News.get(ticker)
        latest = news.first
        latest.headline
        latest.url
    end


    def dividends_given 
        dividends = IEX::Resources::Dividends.get(ticker, '6m')
        if dividends[0] == nil
           return  "This stock doesn't give dividends"
        else
            return dividends[0].amount_dollar
        end  
    end

    def dividends_date
        dividends = IEX::Resources::Dividends.get(ticker, '6m')
        if dividends[0] == nil
           return  "This stock doesn't give dividends"
        else
             return dividends[0].payment_date
        end
    end

    def open_price
        ohlc = IEX::Resources::OHLC.get(ticker) 
        ohlc.open.price
    end



    def get_pe
        earnings = IEX::Resources::Earnings.get(ticker)
        earnings[0].actual_eps
    end

    def estimated_eps
        earnings = IEX::Resources::Earnings.get(ticker)
        earnings[0].estimated_eps
    end

    def company_name 
        company = IEX::Resources::Company.get(ticker)
        company.company_name
    end
    
    def year_high 
        key_stats = IEX::Resources::KeyStats.get(ticker)
        key_stats.week_52_high
    end

    def market_news
    end

    
end