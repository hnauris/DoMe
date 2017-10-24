class PagesController < ApplicationController
  def home
  end

  def about
    @last_seen = current_user.last_seen_at
    @new_posts = Post.where(:created_at > @last_seen)
    @updated_posts = Post.where(:updated_at > @last_seen)
  end

  def contact
  end
end
