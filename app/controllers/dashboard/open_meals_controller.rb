class Dashboard::OpenMealsController < Dashboard::ApplicationController
  before_action :redirect_unless_host

  def index
  end

  private

  def redirect_unless_host
    redirect_to dashboard_root_path and return unless current_user.host?
  end
end
