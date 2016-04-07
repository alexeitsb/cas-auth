class Templates::EmailUpdatePassword
  def initialize(user)
    @user = user
  end

  def subject
    "Solicitação de nova senha para #{@user.username}"
  end

  def body
    "<div>Oi!</div>" +
    "<div>#{@user.name} solicitou uma nova senha.</div>" +
    "<br />" +
    "<div>Para criar sua senha <a href='#{SETTINGS['root_uri']}/casino/passwords/edit?token=#{@user.reset_password_token}'>acesse este link</a>.</div>" +
    "<div>Caso você não tenha solicitado uma nova senha por favor desconsidere este e-mail.</div>"
  end
end
