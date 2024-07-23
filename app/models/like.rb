# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  after_create :create_notification, :send_notification_email

  private

  def create_notification
    Notification.create(
      user: post.user,
      subject: self,
      notification_type: 'new_like',
      message: "#{user.name}さんがあなたのポストをいいねしました"
    )
  end

  def send_notification_email
    NotificationMailer.with(user: post.user, like: self).new_like_email.deliver_later
  end
end
