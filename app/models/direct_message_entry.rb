# frozen_string_literal: true

class DirectMessageEntry < ApplicationRecord
  belongs_to :user
  belongs_to :direct_message_room
end
