class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_is_group_member
  before_action :is_owner?, only: [:edit, :update, :destroy]
  def index
    @date = params[:date]
    @group = Group.find(params[:group_id])
    @posts = @group.posts
  end

  def new
    @post = Post.new
    @date = params[:date]
  end

  def create
    @date = params[:date]
    @group = Group.find(params[:group_id])
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.group_id = @group.id
    @post.importance = 1
    @group.posts << @post
    if @post.save
      flash[:success] = 'Post has been created successfully!'
      redirect_to group_path(@group)
    else
      flash[:danger] = @post.errors.full_messages
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to group_path(@group)
      flash[:success] = 'Post has been updated successfully!'
    else
      flash[:danger] = @post.errors.full_messages
      render 'edit'
    end
  end

  def show
    
  end

  

  def destroy
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to group_path(@group)
    flash[:success] = 'Post has been deleted successfully!'
  end
  private

  def post_params
    params.require(:post).permit(:date, :title, :description, :importance, :user_id, :group_id)
  end
  def verify_is_group_member
    @group = Group.find(params[:group_id])
    if @group.member_list.include?(current_user.email)
      return
    end
  end
  def is_owner?
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
    if current_user.id == @post.user_id
      return
    else
      redirect_to group_path(@group)
    end
  end
end
