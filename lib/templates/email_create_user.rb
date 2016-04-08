class Templates::EmailCreateUser
  def initialize(casino_user_client, password)
    @user = casino_user_client.casino_user
    @client = casino_user_client.client
    @password = password
  end

  def subject
    "Usuário #{@user.username} criado"
  end

  def body
    "<div>Oi!</div>" +
    "<div>Somos #{@client.description}.</div>" +
    "<div>Criamos uma conta para você.</div>" +
    "<br />" +
    "<div>Sua conta pode ser acessada através do endereço <a href='#{@client.uri}'>#{@client.uri}</a>.</div>" +
    "<br />" +
    "<div>Seu usuário é <span style='font-weight: bold;'>#{@user.username}</span></div>" +
    "<div>Criamos uma senha pra você e você poderá alterá-la a qualquer momento.</div>" +
    "<div>Sua senha por enquanto é <span style='font-weight: bold;'>#{@password}</span></div>"
  end
end
