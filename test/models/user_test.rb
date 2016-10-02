require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:sanchez)
  end

  test 'should be valid' do
    assert @user.valid?
    assert @user.save
  end

  test 'shoud require username' do
    empty_usernames = [nil, '', ' ' * 5]
    empty_usernames.each do |username|
      @user.username = username
      assert_not @user.valid?
    end
  end

  test 'password should allow nil' do
    empty_passwords = [nil, '', ' ' * 5]
    empty_passwords.each do |password|
      @user.password = password
      assert_not @user.valid?
    end
  end

  test '.digest should generate token with cost' do
    password_text = 'password'
    password_digest = User.digest('password_text')
    assert_not_empty password_digest
    assert_not_equal password_text, password_digest
  end

  test '.new_token should generate new token' do
    token = User.new_token
    assert_not_empty token
  end
end
