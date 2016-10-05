# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#  role            :integer          default(0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:sanchez)
  end

  test 'should be valid' do
    assert @user.valid?
    assert @user.save
  end

  test 'username should be uniqueness' do
    user = User.new(username: 'sanchez', password: 'password')
    user.save

    assert_not_empty user.errors.messages[:username]
  end

  test 'shoud require username' do
    should_require(@user, :username)
  end

  test 'shoud require password' do
    should_require(@user, :password)
  end

  test '.digest should generate token with cost' do
    ActiveModel::SecurePassword.stubs(:min_cost).returns(5)
    password_text = 'password'
    password_digest = User.digest(password_text)
    assert_not_empty password_digest
    assert_not_equal BCrypt::Password.create(password_text, cost: ActiveModel::SecurePassword.min_cost), password_digest
  end

  test '.digest should set cost as BCrypt::Engine.cost ' do
    cost = 5
    BCrypt::Engine.stubs(:cost).returns(cost)
    ActiveModel::SecurePassword.stubs(:min_cost).returns(false)
    password_text = 'password'
    password_digest = User.digest(password_text)

    assert_not_empty BCrypt::Password.create(password_text, cost: cost), password_digest
  end

  test '.new_token should generate new token' do
    token = User.new_token
    assert_not_empty token
  end

  test 'should have role default moderator' do
    user = User.new
    assert_equal 'mod', user.role
  end
end
