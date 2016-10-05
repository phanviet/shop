# Authenticate with username and password
class UserAuthService
  def initialize(username: '', password: '')
    @username = username
    @password = password
  end

  def authenticate
    user = User.find_by(username: @username)
    return user if user && user.authenticate(@password)
    nil
  end
end
