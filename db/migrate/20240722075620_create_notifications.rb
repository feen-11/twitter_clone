# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :subject, polymorphic: true, null: false
      t.string :notification_type, null: false
      t.string :message, null: false
      t.datetime :read_at
      t.timestamps
    end
  end
end
