require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:sanchez)
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'shoud require username' do
    empty_usernames = [nil, '', ' ' * 5]
    empty_usernames.each do |username|
      @user.username = username
      assert_not @user.valid?
    end
  end
end
