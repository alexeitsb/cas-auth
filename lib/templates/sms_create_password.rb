class Templates::SmsCreatePassword
  def initialize(user, password)
    @user = user
    @password = password
  end

  def body
    "Oi #{@user.name}. Sua nova senha é #{@password}"
  end
end
