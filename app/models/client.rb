class Client < ActiveRecord::Base
  after_create :create_api_token

  has_many :casino_user_clients
  has_many :casino_users, through: :casino_user_clients

  default_scope { order(:description) }


  private

  def create_api_token
    api_token = ""
    loop do
      api_token = SecureRandom.uuid
      break unless Client.exists?(api_token: api_token)
    end
    update_attributes(api_token: api_token)
  end
end
