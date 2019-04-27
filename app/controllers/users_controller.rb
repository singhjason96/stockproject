class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @stocks = @user.stocks
    end

    def new
        @user = User.new
    end


    def create 
        @user = User.new(user_params)
        if @user.valid?
          @user.save
          session[:user_id] = @user.id
          redirect_to "/users/#{@user.id}"
        else
         
          render 'new'
        end
      end

      def edit
        @user = User.find(params[:id])
        @stocks = Stock.all
      end

      def index
        @users = User.all
    
      end

      def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          redirect_to "/users/#{@user.id}/stocks", notice: 'Updated'
        end
        
      end

    

    def delete
    end

    private
    def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :email, :phone_number, :password, :password_confirmation)
    end


end
