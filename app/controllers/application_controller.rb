class ApplicationController < ActionController::Base
  include DevisePermittedParams

  before_action :redirect_if_user_required_information_are_missing, unless: :devise_controller?

  private

  def redirect_if_user_required_information_are_missing
    return if controller_name == "dashboard"
    redirect_to dashboard_path if current_user && (current_user.first_name.nil? || current_user.city.nil?)
  end
end
