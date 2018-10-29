class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    redirect_to admin_root_path and return if current_user.admin?
  end
end
