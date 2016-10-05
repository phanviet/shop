module ApplicationHelper
  def current_user
    return unless session[:user_id]

    @user ||= User.find_by(id: session[:user_id])
  end

  def user_logged_in?
    current_user.present?
  end
end
