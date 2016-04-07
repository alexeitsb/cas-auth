class CASino::UsersController < CASino::ApplicationController
  before_action :check_signed_in, only: [:edit_password, :update_password]

  def edit_password
    @user = CasinoUser.find(params[:id])
  end

  def update_password
    if @user = CasinoUser.find(params[:id])
      if params[:password] == params[:password_confirmation]
        unless params[:password].size >= 4
          flash.now[:error] = "A senha nova deve ter pelo menos quatro caracteres."
        else
          @user.update_attributes(password: params[:password])
          Notification.create(entity: Notification.entities["email"], from: SETTINGS["mailer"]["from"], to: @user.email, subject: Templates::EmailUpdateUser.new(@user).subject, body: Templates::EmailUpdateUser.new(@user).body)
          flash.now[:notice] = "Sua senha foi atualizada. Utilize ela a partir do seu próximo acesso."
        end
      else
        flash.now[:error] = "A senha nova e a confirmação da senha nova são diferentes."
      end
    else
      flash.now[:error] = "O usuário não foi encontrado."
    end
    render "edit_password"
  end


  private

  def check_signed_in
    redirect_to "/401.html" unless signed_in?
  end
end
