class AddClientsNamesToCASinoUsers < ActiveRecord::Migration
  def change
    add_column :casino_users, :clients_names, :string, after: :updated
  end
end
