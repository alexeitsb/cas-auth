class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :entity
      t.string :from
      t.text :to
      t.text :cc
      t.text :bcc
      t.string :reply_to
      t.text :headers
      t.string :subject
      t.text :body
      t.text :attachments
      t.string :tag
      t.datetime :requested_at
      t.string :message_id

      t.timestamps null: false
    end
  end
end
