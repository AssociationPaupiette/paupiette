class Admin::DashboardController < Admin::ApplicationController
  def index
    authorize! :read, :Dashboard
    @cities = City.all
  end
end
