class SessionsController < ApplicationController

    skip_before_action :verify_authenticity_token

    def new
    end

    def create
        @user = User.find_by_email(params[:session][:email])
        if @user && @user.authenticate(params[:session][:password])
          session[:user_id] = @user.id
          
          #redirect_to bucket_path(@user.bucket_id)
          # TODO: Associate buckets to Users
          redirect_to buckets_path
        else
          redirect_to new_session_path
        end 
    end
    
    def destroy 
        session[:user_id] = nil 
        redirect_to root_path
    end
end
