class User < ApplicationRecord
    has_many :stocks    
    has_secure_password
    def self.global_stock_update
        puts "Update Stocks Here"
    end
    


end