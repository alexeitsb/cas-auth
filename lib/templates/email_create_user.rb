class Templates::EmailUpdateUser
  def initialize(user, password)
    @user = user
    @password = password
  end

  def subject
    "Usuário #{@user.username} criado"
  end

  def body
    ""
  end
end
