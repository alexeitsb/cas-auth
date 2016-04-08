class AddUpdatedToCASinoUsers < ActiveRecord::Migration
  def change
    add_column :casino_users, :updated, :boolean, default: false, after: :admin
  end
end
