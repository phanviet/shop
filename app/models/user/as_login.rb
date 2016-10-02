class User::AsLogin
  include ActiveModel::AttributeMethods
  include ActiveModel::Validations
  extend ActiveModel::Translation

  attr_accessor :username, :password

  validates :name, presence: true
  validates :password, presence: true

  def save
    return unless self.valid?

    user = User.
  end
end
