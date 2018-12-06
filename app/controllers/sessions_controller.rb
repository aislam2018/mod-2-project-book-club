class SessionsController < ApplicationController

  def new

  end

  def create
    flash[:errors] = []
    if params[:user_name].empty? || params[:password].empty?
      flash[:errors].push("Username/Password cannot be blank")
      redirect_to new_session_path
    else

    @user = User.find_by(user_name: params[:user_name])
    if @user && @user.authenticate(params[:password])
      # log me in
      session[:user_id] = @user.id
      redirect_to @user
    else
      # dont

      flash[:errors].push("Username/Password does not match")
      redirect_to new_session_path
  end
end
end 


end
