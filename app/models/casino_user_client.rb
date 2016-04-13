class CASinoUserClient < ActiveRecord::Base
  belongs_to :casino_user
  belongs_to :client

  scope :to_callback, -> { joins(:casino_user).joins(:client).where("casino_users.updated = true AND clients.callback_uri IS NOT NULL") }
end
