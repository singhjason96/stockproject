class SessionsController < ApplicationController
    def new
        if session[:user_id] != nil
            redirect_to "/users/"+ session[:user_id].to_s
        end
    end

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to "/users/"+@user.id.to_s
        else 
            @error = "Email or Password is Incorrect"
            render "new"

        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to new_session_path
    end
end
