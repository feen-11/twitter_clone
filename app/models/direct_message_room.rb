# frozen_string_literal: true

class DirectMessageRoom < ApplicationRecord
  has_many :direct_message_entries, dependent: :destroy
  has_many :direct_messages, dependent: :destroy
end
