class FollowersController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @followers = @group.followers
  end

  def show
  end

  def new
  end

  def edit
    @group = Group.find(params[:group_id])
    @follower = @group.followers.find(params[:id])
  end

  def update
    @group = Group.find(params[:group_id])
    @follower = @group.followers.find(params[:id])
    @group.member_list << @follower.email
    redirect_to group_followers_path(:group_id => @group.id)
  end

end
