# frozen_string_literal: true

class DirectMessageEntry < ApplicationRecord
  belongs_to :user
  belongs_to :direct_message_room
  validates :direct_message_room_id, uniqueness: { scope: :user_id }
end
