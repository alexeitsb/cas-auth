class AddAdminToCASinoUsers < ActiveRecord::Migration
  def change
    add_column :casino_users, :admin, :boolean, default: false, after: :extra_attributes
  end
end
