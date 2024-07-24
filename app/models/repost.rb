# frozen_string_literal: true

class Repost < ApplicationRecord
  belongs_to :post
  belongs_to :user

  after_create :create_notification, :send_notification_email

  private

  def create_notification
    Notification.create(
      user: post.user,
      subject: self,
      notification_type: 'repost',
      message: "#{user.name}さんがあなたのポストをリポストしました"
    )
  end

  def send_notification_email
    NotificationMailer.with(user: post.user, repost: self).new_repost_email.deliver_later
  end
end
