class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_is_group_member
  def index
    
  end

  def show
  end

  def new
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    @comment = Comment.new
    @group = Group.find(params[:group_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post_id = @post
    @comment.user_id = current_user.id
    @user = current_user
    @user.comments << @comment
    @group = Group.find(params[:group_id])
    @post.comments << @comment
    if @comment.save
      flash[:success] = "Comment added successfully!"
      redirect_to new_group_post_comment_path(@group.id, @post.id)
    else
      flash[:danger] = @comment.errors.full_messages
      redirect_to new_group_post_comment_path(@group.id, @post.id)
    end
  end

  def edit
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :post_id, :user_id)
  end
  def verify_is_group_member
    @group = Group.find(params[:group_id])
    if @group.member_list.include?(current_user.email)
      return
    end
  end
  
end
