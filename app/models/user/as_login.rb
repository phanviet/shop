class User::AsLogin
  include ActiveModel::AttributeMethods
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Translation

  attr_accessor :username, :password, :user

  validates :username, presence: true
  validates :password, presence: true

  validate :authenticate

  def initialize(username: '', password: '')
    @username = username
    @password = password
  end

  def authenticate
    errors.add(:_, I18n.t('.credential_fail')) unless user_from_auth
  end

  def user_from_auth
    auth = UserAuthService.new(username: username, password: password)
    @user = auth.authenticate
  end

  def save
    return unless self.valid?

    user
  end
end
