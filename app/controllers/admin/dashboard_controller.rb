class Admin::DashboardController < Admin::ApplicationController
  def index
    authorize! :read, :Dashboard
    @active_cities = City.active
    @inactive_cities = City.inactive
  end
end
