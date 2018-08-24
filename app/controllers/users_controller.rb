class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(email: params[:email], password: params[:password])

        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render 'users/new' #<-- show the form again
        end
    end

    def show_completed
        @featured_user = User.most_completed_items
        @most_completed_users = User.second_most_completed_items
    end


end
