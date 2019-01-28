class StocksController < ApplicationController
    def show
        @stock = Stock.find(params[:id])
      end

    def new
        @stock = Stock.new
    end

    def index 
        @stocks = Stock.all
    end
    def create
        @stock = Stock.new(stock_params)
        @stock.user_id = params[:user_id]
        if @stock.valid?
          @stock.save
          redirect_to "/users/#{@stock.user_id}"
        else
            @errors = @stock.errors.full_messages
            render 'new'
        end
      end
    

    private 
    def stock_params
        params.require(:stock).permit(:ticker, :stop)
    end 
end
