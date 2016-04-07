class Templates::EmailUpdateUser
  def initialize(user)
    @user = user
  end

  def subject
    "Senha do usuário #{@user.username} atualizada"
  end

  def body
    "<div>Oi!</div>" +
    "<div>A senha de #{@user.name} foi atualizada.</div>"
  end
end
