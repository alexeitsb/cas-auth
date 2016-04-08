class AddTelephoneToCASinoUsers < ActiveRecord::Migration
  def change
    add_column :casino_users, :telephone, :string, after: :email
  end
end
