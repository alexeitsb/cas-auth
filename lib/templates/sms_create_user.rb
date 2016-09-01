class Templates::SmsCreateUser
  def initialize(user, password)
    @user = user
    @password = password
  end

  def body
    "Oi #{@user.name}. Para acessar o sistema de monitoramento utilize usuário #{@user.username} e senha #{@password}"
  end
end
