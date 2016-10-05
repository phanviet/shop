module SessionsHelper
  # Allow user login and display flash message
  def login_and_flash(user)
    login(user)
    flash[:success] = t('login.admin.success')
  end

  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session[:user_id] = nil
  end
end
