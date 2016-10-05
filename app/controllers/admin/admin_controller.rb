class Admin::AdminController < ActionController::Base
  include ApplicationHelper

  protect_from_forgery with: :exception

  def authenticate_user
    return redirect_to login_url unless user_logged_in?
  end
end
