class User < ApplicationRecord
    has_many :stocks    
    
    def global_stock_update
        puts "Update Stocks Here"
    end

end
