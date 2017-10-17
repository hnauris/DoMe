class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end

  def show
  end

  def new
  end

  def edit
  end
end
