require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  include SessionsHelper

  setup do
    @user = users(:sanchez)
  end

  test '#current_user should fetch current user' do
    login(@user)

    assert_equal @user, current_user

    logout

    assert_nil current_user
  end

  test '#user_logged_in? should verify current_user present' do
    login(@user)

    assert user_logged_in?

    logout

    assert_not user_logged_in?
  end
end
