class CreateCASinoUserClients < ActiveRecord::Migration
  def change
    create_table :casino_user_clients do |t|
      t.references :casino_user, index: true
      t.references :client, index: true

      t.timestamps null: false
    end
  end
end
