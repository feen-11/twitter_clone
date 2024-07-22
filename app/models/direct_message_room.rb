# frozen_string_literal: true

class DirectMessageRoom < ApplicationRecord
  has_many :direct_message_entries, dependent: :destroy
  has_many :direct_messages, dependent: :destroy

  def messaging_user(current_user)
    direct_message_entries.where.not(user_id: current_user.id).first.user
  end
end
