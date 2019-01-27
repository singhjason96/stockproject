class StocksController < ApplicationController
    def show
        @stock = Stock.find(params[:id])
      end

    def new
        @stock = Stock.new
        @stock = Stock.find(params[:cohort_id])
    end

    def index 
        @stocks = Stock.all
    end
    def create
        @stock = Stock.new(course_params)
        @stock_id = params[:stock_id]
        if @stock.valid?
          @stock.save
          redirect_to "/stock/#{@stock_id}"
        
      end
    

    private 
    def stock_params
        params.require(:stock).permit(:symbol, :tick, :stop)
    end 
end
