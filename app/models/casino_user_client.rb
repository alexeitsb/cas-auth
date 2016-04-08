class CASinoUserClient < ActiveRecord::Base
  belongs_to :casino_user
  belongs_to :client
end
