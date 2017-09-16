class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
    @group = params[:group_idd]
  end

  def create
    @post = Post.new(post_params)
    @date = params[:date]
    @group = params[:group_idd]

    @post.date = @date
    @post.user_id = current_user.id
    @post.group_id = @group.to_i
    @post.importance = 1
    if @post.save
      flash[:success] = 'Post has been created successfully!'
      redirect_to group_path
    else
      flash[:danger] = @post.errors.full_messages
      render 'new'
    end
  end

  def edit
  end

  def show
    @posts = Post.all
    @date = params[:date]
    @group = params[:group_idd]
  end

  private

  def post_params
    params.require(:post).permit(:date, :description, :importance, :user_id, :group_id)
  end
end
