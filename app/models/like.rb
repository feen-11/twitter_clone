# frozen_string_literal: true

class Like < ApplicationRecord
  include CreateNotification

  belongs_to :post
  belongs_to :user

  private

  def notification_user
    post.user
  end

  def notification_type
    'like'
  end

  def notification_message
    "#{user.name}さんがあなたのポストをいいねしました"
  end
end
