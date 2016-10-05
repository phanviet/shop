require 'test_helper'

class UserAuthServiceTest < ActiveSupport::TestCase
  setup do
    @valid_credential = { username: 'sanchez', password: 'password' }
    @invalid_credential = { username: 'sanchez', password: 'invalid' }
  end

  test 'should authenticate success' do
    user_auth = UserAuthService.new(username: @valid_credential[:username],
                                    password: @valid_credential[:password])

    assert_not_nil user_auth.authenticate
  end

  test 'should authenticate fail' do
    user_auth = UserAuthService.new(username: @invalid_credential[:username],
                                    password: @invalid_credential[:password])

    assert_nil user_auth.authenticate
  end
end
