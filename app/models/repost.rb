# frozen_string_literal: true

class Repost < ApplicationRecord
  include CreateNotification

  belongs_to :post
  belongs_to :user

  private

  def notification_user
    post.user
  end

  def notification_type
    'repost'
  end

  def notification_message
    "#{user.name}さんがあなたのポストをリポストしました"
  end
end
