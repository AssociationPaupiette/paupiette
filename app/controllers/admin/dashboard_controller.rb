class Admin::DashboardController < Admin::ApplicationController
  def index
    authorize! :read, :Dashboard
  end
end
