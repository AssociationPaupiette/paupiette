class Dashboard::Ambassador::ApplicationController < Dashboard::ApplicationController
  before_action :redirect_if_unauthorized

  add_breadcrumb 'Ambassadeur', :dashboard_ambassador_root_path

  def index
    redirect_to :dashboard_ambassador_activity
  end

  private

  def redirect_if_unauthorized
    redirect_to :dashboard_root unless can? :manage, :city
  end
end
