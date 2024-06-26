class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def new
        @user = User.new
    end

    def create 
        @user = User.new(user_params) 
        if @user.save 
          session[:user_id] = @user.id 
          
          #redirect_to bucket_path(@user.bucket_id)
          # TODO: Associate buckets to Users
          redirect_to buckets_path
        else 
          redirect_to signup_path
        end 
    end 
    
    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end


end
