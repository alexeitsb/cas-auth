class ApiController < ApplicationController
  protect_from_forgery with: :null_session

  def sign_in
    if validation_result = validate_login_credentials(params[:username], params[:password])
      tgt = acquire_ticket_granting_ticket(validation_result, request.user_agent, request.remote_ip, credentials_supplied: true)
      render json: { ticket: tgt["ticket"] }, status: :ok
    else
      render json: { description: "As informações são inválidas" }, status: :unauthorized
    end
  end

  def sign_out
    remove_ticket_granting_ticket(params[:ticket], request.user_agent)
    render json: { }, status: :ok
  end

  def create_user
    if client = Client.find_by_api_token(params[:client_token])
      if user = CASinoUser.find_by_username(params[:username])
        if CASinoUserClient.find_by_casino_user_id_and_client_id(user.id, client.id)
          render json: { description: "O usuário #{user.username} já possui este cliente" }, status: :unauthorized
        else
          casino_user_client = CASinoUserClient.create(casino_user: user, client: client)
          Notification.create(entity: Notification.entities["email"], from: SETTINGS["mailer"]["from"], to: user.email, subject: Templates::EmailAddClientToUser.new(casino_user_client).subject, body: Templates::EmailAddClientToUser.new(casino_user_client).body)
          render json: { description: "O usuário #{user.username} foi adicionado ao cliente" }, status: :ok
        end
      else
        user = CASinoUser.new(authenticator: SETTINGS["authenticator"]["name"], username: params[:username], email: params[:email], password: (password = SecureRandom.hex(4)))
        if user.save
          casino_user_client = CASinoUserClient.create(casino_user: user, client: client)
          Notification.create(entity: Notification.entities["email"], from: SETTINGS["mailer"]["from"], to: user.email, subject: Templates::EmailCreateUser.new(casino_user_client, password).subject, body: Templates::EmailCreateUser.new(casino_user_client, password).body)
          render json: { description: "O usuário #{user.username} foi criado e adicionado ao cliente" }, status: :ok
        else
          render json: user.errors, status: :unprocessable_entity
        end
      end
    else
      render json: { description: "O cliente não foi encontrado" }, status: :unauthorized
    end
  end

  def reset_password
    if user = CASinoUser.find_by_username(params[:username])
      user.update_attributes(encrypted_password: "")
      Notification.create(entity: Notification.entities["sms"], to: user.telephone, body: Templates::SmsResetPassword.new(user).body)
      render json: { }, status: :ok
    else
      render json: { description: "O usuário #{params[:username]} não foi encontrado" }, status: :unauthorized
    end
  end

  def update_password
    if user = CASinoUser.find_by_username(params[:username])
      if params[:password] && params[:password].size >= 4
        user.update_attributes(password: params[:password])
        Notification.create(entity: Notification.entities["sms"], to: user.telephone, body: Templates::SmsUpdatePassword.new(user).body)
        render json: { }, status: :ok
      else
        render json: { description: "A senha deve ter no mínimo 4 caracteres" }, status: :unprocessable_entity
      end
    else
      render json: { description: "O usuário #{params[:username]} não foi encontrado" }, status: :unauthorized
    end
  end
end
