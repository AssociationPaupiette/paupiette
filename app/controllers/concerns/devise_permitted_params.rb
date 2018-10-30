module DevisePermittedParams
  extend ActiveSupport::Concern

  included do
    before_action :configure_devise_permitted_parameters, if: :devise_controller?
  end

  def configure_devise_permitted_parameters
    edit_user_params = [:first_name, :description, :city_id, :photo, :identity_card, :specialties, :reception_days => []]
    if params[:action] == 'update'
      devise_parameter_sanitizer.permit(:account_update, keys: edit_user_params)
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.permit(:sign_up, keys: [:host_sign_up])
    end
  end
end