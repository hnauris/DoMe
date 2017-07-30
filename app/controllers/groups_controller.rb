class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end
  def create
    @group = Group.new(group_params)
    @group.admin = current_user.email
    @group.augstskola_id = 1
    if @group.save
      flash[:success] = 'Group has been created successfully!'
      redirect_to groups_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  private
  def group_params
    params.require(:group).permit(:name, :admin, :augstskola_id, :user_id)
  end

end
