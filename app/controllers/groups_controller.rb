class GroupsController < ApplicationController
  before_action :find_group, only:[:show, :edit, :update, :destroy]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end
  def show
  end
  def edit
  end
  def create
    @group = Group.create(group_params)
    redirect_to @group
  end

  def update
    @group.update(group_params)
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
