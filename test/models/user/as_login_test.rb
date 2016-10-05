require 'test_helper'

class User::AsLoginTest < ActiveSupport::TestCase
  setup do
    @credential = { username: 'sanchez', password: 'password' }

    @user_as_login = user_credential_factory(@credential[:username],
                                            @credential[:password])
  end

  test 'shoud require username' do
    should_require(@user_as_login, :username)
  end

  test 'should require password' do
    should_require(@user_as_login, :password)
  end

  test 'should save succcess' do
    assert_not_nil @user_as_login.user_from_auth
    assert @user_as_login.save
  end

  test 'should save fail' do
    @user_as_login.password = 'invalid'

    assert_nil @user_as_login.user_from_auth
    assert_not @user_as_login.save
    assert_not_empty @user_as_login.errors.messages[:_]
  end

  private

  def user_credential_factory(username, password)
    User::AsLogin.new(username: username, password: password)
  end
end
