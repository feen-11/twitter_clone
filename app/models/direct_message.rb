# frozen_string_literal: true

class DirectMessage < ApplicationRecord
  belongs_to :user
  belongs_to :direct_message_room
end
