class GroupsController < ApplicationController
  before_action :find_group, only:[:show, :edit, :update, :destroy]

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
    @group.creator_id = 2
    # @group.user_id = 2
    @group.save

    redirect_to @group
  end

  def update
    @user = User.find(2)

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
    @group.destroy
    redirect_to groups_path
  end

  private
  def find_group
    @group = Group.find(params[:id])
  end
  def group_params
    params.require(:group).permit(:name, :book_id, :creator_id, :first_meeting, :days, :reading_amount)
  end
end
