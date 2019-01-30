class StocksController < ApplicationController
    def edit
        @stock = Stock.find(params[:id])
        @stocks = Stock.all
      end
    
    def show
        @stock = Stock.find(params[:id])
      end

    def new
        @stock = Stock.new
    end

    def create
        @stock = Stock.new(stock_params)
        @stock.user_id = params[:user_id]
        if @stock.valid?
          @stock.save
          redirect_to "/users/#{params[:user_id]}/stocks/#{@stock.id}"
          
        else
            @errors = @stock.errors.full_messages
            render 'new'
        end
      end

    def index 
        @stocks = Stock.all
    end
    

      def update 
        @stock = Stock.find(params[:id])
        if @stock.update(stock_params)
          redirect_to "/users/#{params[:user_id]}", notice: "Stock Updated"
        end
      end

      def destroy 
        @stock = Stock.find(params[:id])
        @stock.destroy
        respond_to do |format|
          format.html { redirect_to user_path(@user.id) }
          format.json { head :no_content }
          format.js { render :layout => false }
        end
      end
    

    private 
    def stock_params
        params.require(:stock).permit(:ticker, :stop)
    end 
end
