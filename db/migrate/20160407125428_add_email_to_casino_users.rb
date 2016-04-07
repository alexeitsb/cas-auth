class AddEmailToCASinoUsers < ActiveRecord::Migration
  def change
    add_column :casino_users, :email, :string, after: :name
  end
end
