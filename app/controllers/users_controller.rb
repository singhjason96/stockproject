class UsersController < ApplicationController

    def new
        @user = User.new
    end


    def create 
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            redirect_to "/users/#{@user.id}"
        end 
    end

    def show
    end

    def delete
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :phone_number, :password)
    end


end
