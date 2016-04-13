class ClientsController < ApplicationController
  before_action :check_user

  def index
  end

  def new
    @client = Client.new
  end

  def edit
    @client = Client.find(params[:id])
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to clients_path
    else
      render :new
    end
  end

  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      redirect_to clients_path
    else
      render :edit
    end
  end


  private

  def client_params
    params.require(:client).permit(:description, :name, :uri, :callback_uri)
  end

  def check_user
    redirect_to "/401.html" unless signed_in? && current_user.admin
  end
end
