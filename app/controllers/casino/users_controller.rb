class CASino::UsersController < CASino::ApplicationController
  before_action :check_signed_in, only: [:profile, :password]
  before_action :find_user, except: [:profile, :password]

  def edit
  end

  def update
    if @user.update(casino_user_params)
      flash.now[:notice] = "Suas informações foram atualizadas com sucesso!"
    end
    render :edit
  end

  def edit_password
  end

  def update_password
    if @user
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

  def update_avatar
    @user.avatar = params[:casino_user][:avatar]
    if @user.valid_attribute?(:avatar)
      @user.save(validate: false)
    else
      @user = CASinoUser.find(params[:id])
      flash.now[:error] = "O arquivo selecionado não é uma imagem."
    end
    render "edit"
  end

  def destroy_avatar
    @user.update_attributes(avatar: nil)
    render "edit"
  end

  def profile
    redirect_to main_app.edit_casino_user_path(current_user)
  end

  def password
    redirect_to main_app.edit_password_casino_user_path(current_user)
  end


  private

  def casino_user_params
    p = params.require(:casino_user).permit(:name, :document, :email, :telephone, :avatar)
    p.merge!(updated: true) if update?
    return p
  end

  def check_signed_in
    redirect_to "/401.html" unless signed_in?
  end

  def find_user
    @user = CASinoUser.find(params[:id])
  end
end
