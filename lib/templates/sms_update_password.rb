class Templates::SmsUpdatePassword
  def initialize(user)
    @user = user
  end

  def body
    "Oi #{@user.name}. Sua senha foi atualizada com sucesso!"
  end
end
