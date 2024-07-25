# frozen_string_literal: true

class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.order(created_at: :desc)
    # rubocop:disable Rails/SkipsModelValidations
    @notifications.where(read_at: nil).update_all(read_at: Time.zone.now)
    # rubocop:enable Rails/SkipsModelValidations
  end
end
