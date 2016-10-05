require 'test_helper'

class Admin::DashboardControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:sanchez)
    login_as_user(@user)
  end

  test "should access dashboard when logged in" do
    get admin_dashboard_index_url
    assert_response :success
  end

  test 'should redirect to login form when not logged in' do
    logout
    get admin_dashboard_index_url
    assert_redirected_to login_url
  end
end
