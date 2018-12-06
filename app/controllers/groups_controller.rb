class GroupsController < ApplicationController
  before_action :find_group, only:[:show, :edit, :update, :destroy]

  skip_before_action :verify_authenticity_token


 before_action :authenticate, only: [:index, :destroy, :create]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
    @books = Book.all
  end
  def show
  end

  def edit

  end

  def create

    @group = Group.create(group_params)

    #update to save to current user
    @group.creator_id = @logged_in_user.id
    # @group.user_id = 2
    @group.save

    redirect_to @group
  end

  def update
    @user = User.find(@logged_in_user.id)

    if params[:remove?] == 'y'
      if @group.users.include?(@user)
      Usergroup.find_by(user_id: @user.id, group_id: @group.id).destroy
      end

    elsif !params[:group_params]
        if !@group.users.include?(@user)
        @group.users << @user
        elsif @group.users.include?(@user)
        end
    else
    @group.update(group_params)

    end

    redirect_to @group

  end
  def destroy
    flash[:errors] = []
    if @logged_in_user.id == @group.creator_id
    @group.destroy

    redirect_to groups_path
  else
    flash[:errors].push("You are not authorized to delete this group")
    redirect_to @group
  end
  end

  private
  def find_group
    @group = Group.find(params[:id])
  end
  def group_params
    params.require(:group).permit(:name, :book_id, :creator_id, :first_meeting, :days, :reading_amount)
  end
end
