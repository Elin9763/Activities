class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new
        @user.email = params[:user][:email]
        @user.save

        redirect_to root_path
    end


end
