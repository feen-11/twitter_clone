# frozen_string_literal: true

class CreateReposts < ActiveRecord::Migration[7.0]
  def change
    create_table :reposts do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :post, null: false, foreign_key: { to_table: :posts }

      t.timestamps
    end

    add_index :reposts, %i[user_id post_id], unique: true
  end
end
