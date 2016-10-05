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

class User < ApplicationRecord
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  # Roles
  # 0: Moderator
  # 1: Administrator
  enum role: [:mod, :admin]

  validates :username, presence: true,
                       length: { maximum: 50 },
                       uniqueness: true
  validates :password, presence: true,
                       length: { minimum: 6 },
                       allow_nil: true

  default_value_for :role, User.roles[:mod]

  class << self
    # Return the hash digest of the given string
    def digest(string)
      cost = if ActiveModel::SecurePassword.min_cost
               BCrypt::Engine::MIN_COST
             else
               BCrypt::Engine.cost
             end
      BCrypt::Password.create(string, cost: cost)
    end

    # Return a random token
    def new_token
      SecureRandom.urlsafe_base64
    end
  end
end
