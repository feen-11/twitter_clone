# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[phone_number birthday name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name biography location website birthday avatar header])
  end

  def login_check
    redirect_to new_user_session_path if current_user.blank?
  end
end
