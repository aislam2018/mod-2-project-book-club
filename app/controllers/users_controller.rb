class UsersController < ApplicationController
  before_action :find_user, only:[:show, :edit, :update, :destroy]
  def new
    @user = User.new
  end
  def show
    @groups = Group.all
    @user = @logged_in_user
  end
  def edit
  end
  def create

    @user = User.new(user_params)
    if @user.save
      log_in!(@user)
    redirect_to @user
    # where do redirect once logged in
  else
    flash[:errors] = @user.errors.full_messages
    redirect_to new_user_path
  end
  end

  def update
    @user.update(user_params)
    redirect_to @user
  end
  def destroy
    @user.destroy
    # redirect_to home page
  end

private
  def find_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name, :user_name, :password)
  end
end
