class AddResetPasswordTokenToCASinoUsers < ActiveRecord::Migration
  def change
    add_column :casino_users, :reset_password_token, :string, after: :telephone
  end
end
