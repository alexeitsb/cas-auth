class AddDocumentToCASinoUsers < ActiveRecord::Migration
  def change
    add_column :casino_users, :document, :string, after: :name
  end
end
