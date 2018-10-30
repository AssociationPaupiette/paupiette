class Dashboard::ActivityController < Dashboard::ApplicationController
  before_action :redirect_unless_ambassador

  def index
  end

  private

  def redirect_unless_ambassador
    redirect_to dashboard_root_path and return unless current_user.ambassador?
  end
end
