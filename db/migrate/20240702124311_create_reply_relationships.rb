class CreateReplyRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :reply_relationships do |t|

      t.timestamps
    end
  end
end
