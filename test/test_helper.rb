ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'mocha/mini_test'
require 'minitest/reporters'
require 'simplecov'

SimpleCov.start
MiniTest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  # Testing require form
  def should_require(obj, key)
    empty_value = [nil, '', ' ' * 5]
    empty_value.each do |value|
      obj.send("#{key}=", value)
      assert_not obj.valid?
      assert_not_empty obj.errors.messages[key]
    end
  end
end

class ActionDispatch::IntegrationTest
  include ApplicationHelper

  def login_as_user(user)
    post login_url, params: {
      user_as_login: {
        username: user.username,
        password: 'password'
      }
    }
  end

  def logout
    delete logout_url
  end
end
