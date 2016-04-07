class AddResetPasswordCreatedAtToCASinoUsers < ActiveRecord::Migration
  def change
    add_column :casino_users, :reset_password_created_at, :string, after: :reset_password_token
  end
end
