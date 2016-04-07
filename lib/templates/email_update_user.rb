class Templates::EmailUpdateUser
  def initialize(user)
    @user = user
  end

  def subject
    "Senha do usuário #{@user.username} atualizada"
  end

  def body
    Templates::Common.email_top +
    "<br />" +
    "<br />" +
    "<div>Oi!</div>" +
    "<div>A senha do usuário #{@user.username} foi atualizada.</div>" +
    "<br />" +
    "<div>Obrigado por utilizar o sistema Transpro</div>" +
    Templates::Common.email_bottom
  end
end
