class ApiController < ApplicationController
  protect_from_forgery with: :null_session

  def sign_in
    if validation_result = validate_login_credentials(params[:username], params[:password])
      tgt = acquire_ticket_granting_ticket(validation_result, request.user_agent, request.remote_ip, credentials_supplied: true)
      render json: { ticket: tgt["ticket"], services: tgt.user.services }, status: :ok
    else
      render json: { }, status: :unauthorized
    end
  end

  def sign_out
    remove_ticket_granting_ticket(params[:ticket], request.user_agent)
    render json: { }, status: :ok
  end

  def create_user
    if user = CasinoUser.find_by_username(params[:username])
      if client = user.clients.find_by_api_token(params[:client_token])
        render json: { description: "O usuário #{user.username} já possui este cliente" }, status: :unauthorized
      else
        CasinoUserClient.create(casino_user: user, client: client)
        render json: { description: "O usuário #{user.username} foi adicionado ao cliente" }, status: :ok
      end
    else
      user = CasinoUser.new(authenticator: SETTINGS["authenticator"]["name"], username: params[:username], email: params[:email], password: (password = SecureRandom.hex(4)))
      if user.save
        CasinoUserClient.create(casino_user: user, client: Client.find_by_api_token(params[:client_token]))
        # TODO: create notification
        render json: { description: "O usuário #{user.username} foi criado e adicionado ao cliente" }, status: :ok
      else
        render json: user.errors, status: :unprocessable_entity
      end
    end
  end

  def reset_password
    if user = CasinoUser.find_by_username(params[:username])
      user.update_attributes(encrypted_password: "")
      render json: { }, status: :ok
    else
      render json: { description: "O usuário #{params[:username]} não existe" }, status: :unauthorized
    end
  end

  def update_password
    if user = CasinoUser.find_by_username(params[:username])
      user.update_attributes(password: params[:password])
      render json: { }, status: :ok
    else
      render json: { description: "O usuário #{params[:username]} não existe" }, status: :unauthorized
    end
  end
end
