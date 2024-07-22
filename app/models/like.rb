# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  after_create :create_notification

  private

  def create_notification
    Notification.create(
      user: post.user,
      subject: self,
      notification_type: 'new_like',
      message: "#{user.name}さんがあなたのポストをいいねしました"
    )
  end
end
