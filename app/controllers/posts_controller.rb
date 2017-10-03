class PostsController < ApplicationController
  def index
    @posts = Post.all
    @date = params[:date]
    @group = params[:group_idd]
  end

  def new
    @post = Post.new
    @date = params[:date]
  end

  def create
    @group = Group.find(params[:group_id])
    @post = Post.new(post_params)
    @post.date = @date
    @post.user_id = current_user.id
    @post.group_id = @group.id
    @post.importance = 1
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
    params.require(:post).permit(:date, :description, :importance, :user_id, :group_id)
  end
end
