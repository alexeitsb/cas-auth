class Client < ActiveRecord::Base
  has_many :casino_user_clients
  has_many :casino_users, through: :casino_user_clients
end
