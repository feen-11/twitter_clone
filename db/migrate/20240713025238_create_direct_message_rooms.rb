# frozen_string_literal: true

class CreateDirectMessageRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :direct_message_rooms, &:timestamps
  end
end
