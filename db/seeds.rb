admin_user = User.create(email: "admin@example.com",
                         password: "password",
                         password_confirmation: "password",
                         admin: true)
Project.create(name: "Ticketee Beta")
