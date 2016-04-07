class CASino::UsersController < CASino::ApplicationController

  def edit_password
    @user = CasinoUser.find(params[:id])
  end

  def update_password
    if @user = CasinoUser.find(params[:id])
      if params[:password_new] == params[:password_confirm]
        unless params[:password_new].size >= 4
          flash.now[:error] = "A senha nova deve ter pelo menos quatro caracteres."
        else
          @user.password = params[:password_new]
          @user.save(validate: false)
          Notification.create(entity: Notification.entities["email"], from: SETTINGS["postmark"]["from"], to: @user.email, subject: Templates::EmailUpdateUser.new(@user).subject, body: Templates::EmailUpdateUser.new(@user).body)
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
end
