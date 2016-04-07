class AddEncryptedPasswordToCASinoUsers < ActiveRecord::Migration
  def change
    add_column :casino_users, :encrypted_password, :string, after: :username
  end
end
