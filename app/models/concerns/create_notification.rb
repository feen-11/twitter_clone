# frozen_string_literal: true

module CreateNotification
  extend ActiveSupport::Concern

  included do
    after_create :create_notification, :send_notification_email
  end

  private

  def create_notification
    Notification.create(
      user: notification_user,
      subject: self,
      notification_type:,
      message: notification_message
    )
  end

  def send_notification_email
    NotificationMailer.with(user: notification_user,
                            notification_type.to_sym => self).send("new_#{notification_type}_email").deliver_later
  end
end
