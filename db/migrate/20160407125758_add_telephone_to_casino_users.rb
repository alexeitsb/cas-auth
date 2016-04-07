class AddTelephoneToCASinoUsers < ActiveRecord::Migration
  def change
    add_column :casino_users, :telephone, :string, after: :document
  end
end
