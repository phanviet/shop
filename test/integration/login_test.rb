require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:sanchez)
    @credential = { username: 'sanchez', password: 'password' }
  end

  test 'should login success and redirect to dashboard' do
    get login_url

    assert_response :success

    post login_url, params: {
      user_as_login: @credential
    }

    assert_equal @user, current_user
    assert_redirected_to admin_dashboard_index_url

    follow_redirect!

    assert_equal admin_dashboard_index_path, path
  end

  test 'should login failure and display errors' do
    get login_url

    assert_template 'sessions/new'
    assert_response :success

    @credential[:password] = 'invalid'

    post login_url, params: {
      user_as_login: @credential
    }

    assert_nil current_user
    assert_select '.form-errors'
    assert_template 'sessions/new'
  end
end
