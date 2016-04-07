class AddNameToCASinoUsers < ActiveRecord::Migration
  def change
    add_column :casino_users, :name, :string, after: :encrypted_password
  end
end
