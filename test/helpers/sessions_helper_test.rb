require 'test_helper'

class SessionsHelperTest < ActionView::TestCase
  setup do
    @user = users(:sanchez)
  end

  test '#login should assign to session for user' do
    login(@user)

    assert_equal @user.id, session[:user_id]
  end

  test '#login_and_flash should login user and display flash message' do
    login_and_flash(@user)

    assert_equal @user.id, session[:user_id]
    assert_equal I18n.t('login.admin.success'), flash[:success]
  end

  test '#logout should delete user session' do
    login(@user)
    logout

    assert_nil session[:user_id]
  end
end
