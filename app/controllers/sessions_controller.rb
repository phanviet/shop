class SessionsController < ApplicationController
  include SessionsHelper

  # Display login form
  def new
    if user_logged_in?
      redirect_to_admin
    else
      @user_as_login = User::AsLogin.new
    end
  end

  # User login
  def create
    @user_as_login = User::AsLogin.new(username: user_params[:username],
                                       password: user_params[:password])
    user = @user_as_login.save
    if user
      login_and_flash(user)
      redirect_to_admin
    else
      render :new
    end
  end

  # User logout
  def destroy
    logout

    redirect_to login_url
  end

  private

  def user_params
    params.require(:user_as_login).permit(:username, :password)
  end

  def redirect_to_admin
    redirect_to admin_dashboard_index_url
  end
end
