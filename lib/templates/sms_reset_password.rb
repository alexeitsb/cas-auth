class Templates::SmsResetPassword
  def initialize(user)
    @user = user
  end

  def body
    "Oi #{@user.name}. Você receberá um SMS com sua nova senha em alguns instantes."
  end
end
