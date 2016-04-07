class CASino::PasswordsController < CASino::ApplicationController
  def new
  end

  def create
    if user = CasinoUser.find_by_username(params[:username])
      token = ""
      loop do
        token = SecureRandom.hex(50)
        break unless CasinoUser.exists?(reset_password_token: token)
      end
      user.update_attributes(reset_password_token: token, reset_password_created_at: Time.now)
      Notification.create(entity: Notification.entities["email"], from: SETTINGS["mailer"]["from"], to: user.email, subject: Templates::EmailUpdatePassword.new(user).subject, body: Templates::EmailUpdatePassword.new(user).body)
      redirect_to root_path, notice: "Um e-mail com as instruções para gerar uma nova senha será enviado para o endereço #{user.email} em alguns instantes."
    else
      flash.now[:error] = "O usuário #{params[:username]} não foi encontrado."
      render "new"
    end
  end

  def edit
    @user = CasinoUser.find_by_reset_password_token(params[:token])
    redirect_to root_path, error: "O usuário não foi encontrado." unless @user
  end

  def update
    if @user = CasinoUser.find_by_reset_password_token(params[:token])
      if params[:password] == params[:password_confirmation]
        unless params[:password].size >= 4
          flash.now[:error] = "A senha deve ter pelo menos quatro caracteres."
        else
          @user.update_attributes(password: params[:password_new], reset_password_token: nil)
          flash.now[:notice] = "Sua senha foi atualizada. Utilize ela a partir do seu próximo acesso."
        end
      else
        flash.now[:error] = "A senha e a confirmação da senha são diferentes."
      end
    else
      flash.now[:error] = "O usuário não foi encontrado."
    end
    render "edit"
  end
end