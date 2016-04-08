class Templates::EmailAddClientToUser
  def initialize(casino_user_client)
    @user = casino_user_client.casino_user
    @client = casino_user_client.client
  end

  def subject
    "Novo cliente"
  end

  def body
    "<div>Oi!</div>" +
    "<div>Você foi adicionado ao serviço #{@client.description}.</div>" +
    "<br />" +
    "<div>Sua conta pode ser acessada através do endereço <a href='#{@client.uri}'>#{@client.uri}</a>.</div>"
  end
end
