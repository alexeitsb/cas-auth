class ApplicationController < ActionController::Base
  include CASino::SessionsHelper
  include CASino::AuthenticationProcessor
  include CASino::TicketGrantingTicketProcessor

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Check if requested action is create.
  def create?
    params[:action] == "create"
  end

  # Check if requested action is update.
  def update?
    params[:action] == "update"
  end
end
