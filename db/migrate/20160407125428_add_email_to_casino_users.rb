class AddEmailToCASinoUsers < ActiveRecord::Migration
  def change
    add_column :casino_users, :email, :string, after: :document
  end
end
