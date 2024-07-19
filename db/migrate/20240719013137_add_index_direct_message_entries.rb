# frozen_string_literal: true

class AddIndexDirectMessageEntries < ActiveRecord::Migration[7.0]
  def change
    add_index :direct_message_entries, %i[user_id direct_message_room_id],
              unique: true,
              name: 'index_dm_entries_on_user_id_and_dm_room_id'
  end
end
