class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_user_can_edit?
  helper_method :user_can_subscribe?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :account_update, keys: [:password, :password_confirmation, :current_password])

    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def current_user_can_edit?(model)
    user_signed_in? && (
    model.user == current_user ||
    (model.try(:event).present? && model.event.user == current_user))
  end

  def user_can_subscribe?(event)
    true unless current_user_can_edit?(event)
  end
end
