require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:sanchez)
  end

  test "should get new" do
    get login_url

    assert_template 'sessions/new'
    assert_response :success
    assert_select 'input[name=?]', 'user_as_login[username]'
    assert_select 'input[type=password][name=?]', 'user_as_login[password]'
  end

  test 'should redirect_to to admin dashboard when logged in' do
    login_as_user(@user)

    get login_url

    assert_redirected_to admin_dashboard_index_url
  end

  test 'should create new session' do
    credential = { username: 'sanchez', password: 'password' }
    post login_url, params: {
      user_as_login: credential
    }

    assert_redirected_to admin_dashboard_index_url
  end

  test 'should return login form with error messages' do
    invalid_credential = { username: 'sanchez', password: 'invalid' }
    post login_url, params: {
      user_as_login: invalid_credential
    }

    assert_template 'sessions/new'
  end

  test "should logout user" do
    delete logout_url

    assert_redirected_to login_url
  end
end
