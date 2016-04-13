# Create admin user.
puts "Creating admin user..."
CASinoUser.create(authenticator: SETTINGS["authenticator"]["name"], username: "admin", name: "Administrador", password: "admin", admin: true)
puts "DONE!"