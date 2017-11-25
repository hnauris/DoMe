class PagesController < ApplicationController
  def home
  end

  def about
    @last_seen = current_user.last_seen_at.to_i
    @new_posts = Post.all
    @updated_posts = Post.all
    current_user.update_attribute(:last_seen_at, Time.now.to_formatted_s(:db))
  end

  def contact
  end
end