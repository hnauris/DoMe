class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @groups = Group.paginate(page: params[:page], per_page: 5)
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
    @group = Group.find(params[:id])
    @user = current_user
    @members = @group.member_list
  end

  def subscribe()
    @group = Group.find(params[:group_id])
    @user = current_user
    @user.follow(@group)
    redirect_to group_path(params[:group_id])
  end

  def edit
    @group = Group.find(params[:id])
    @followers = @group.followers
  end

  def update
    @group = Group.find(params[:id])
    @follower = @group.followers.find(params[:id])
    @group.member_list << params[:follower]
    if @group.save
      redirect_to root_path
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, :admin, :augstskola_id, :user_id, member_list: [])
  end

end
