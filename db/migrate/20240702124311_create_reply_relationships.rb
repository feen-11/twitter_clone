class CreateReplyRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :reply_relationships do |t|
      t.references :replied, null: false, foreign_key: { to_table: :posts }
      t.references :replying, null: false, foreign_key: { to_table: :posts }

      t.timestamps
    end
  end
end
