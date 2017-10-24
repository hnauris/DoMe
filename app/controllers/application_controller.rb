class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_last_seen_at, if: proc {user_signed_in?}
  private
  def set_last_seen_at
    current_user.update_attribute(:last_seen_at => Time.now)
  end
end
