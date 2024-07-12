class CreateBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmarks do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :post, null: false, foreign_key: { to_table: :posts }

      t.timestamps
    end

    add_index :bookmarks, %i[user_id post_id], unique: true
  end
end
