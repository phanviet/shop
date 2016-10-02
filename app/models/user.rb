class User < ApplicationRecord
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :username, presence: true, length: { maximum: 50 }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

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
