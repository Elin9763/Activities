class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new
        @user.email = params[:user][:email]
        if @user.save
            redirect_to root_path
        else
            render 'users/new' #<-- show the form again
        end
    end


end
