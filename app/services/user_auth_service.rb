# Authenticate with username and password
class UserAuthService
  def initialize(username: '', password: '')
    @username = username
    @password = password
  end

  def authenticate
    user = User.find_by(username: @username)
    if user && user.authenticate(@password)
      user
    else
      nil
    end
  end
end
