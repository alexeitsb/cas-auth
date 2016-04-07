class Notification < ActiveRecord::Base
  scope :to_send, -> { where("message_id IS NULL") }

  enum entity: { email: 1, sms: 2 }
end
