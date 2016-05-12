# Create admin user.
puts "Creating admin user..."
CASinoUser.create(authenticator: SETTINGS["authenticator"]["name"], username: "admin", name: "Administrador", password: "admin", admin: true)
CASinoUser.create(authenticator: SETTINGS["authenticator"]["name"], username: "user", name: "Usuário", password: "user")
puts "DONE!"