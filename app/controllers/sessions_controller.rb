class SessionsController < ApplicationController

  def new

  end

  def create
    flash[:errors] = []
    if params[:user_name].empty? || params[:password].empty?
        flash[:errors].push("Password field or user name field cannot be empty")
        redirect_to new_session_path
    else
        @user = User.find_by(user_name: params[:user_name])
        if @user && @user.authenticate(params[:password])
          log_in!(@user)
          setup_show_user
          redirect_to @logged_in_user
        else
        flash[:errors].push("Username and Password does not match")
        redirect_to new_session_path
        end
      end
  end

end
