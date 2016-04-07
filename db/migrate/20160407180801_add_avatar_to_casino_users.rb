class AddAvatarToCASinoUsers < ActiveRecord::Migration
  def change
     add_attachment :casino_users, :avatar
  end
end
