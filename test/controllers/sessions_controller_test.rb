require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_url

    assert_template 'sessions/new'
    assert_response :success
    assert_select 'input[name=?]', 'user_as_login[username]'
    assert_select 'input[type=password][name=?]', 'user_as_login[password]'
  end

  test "should get destroy" do
    # get logout_url
    # assert_response :success
  end

end
