class SessionsController < ApplicationController
  def new
    # Display login form
    @user_as_login = User::AsLogin.new
  end

  def destroy
  end
end
