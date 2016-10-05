admin_user = User.new(username: 'admin',
                      password: 'password',
                      role: User.roles[:admin])
admin_user.save
