class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_is_group_member
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
  end

  def show
    
  end

  def update
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
end
