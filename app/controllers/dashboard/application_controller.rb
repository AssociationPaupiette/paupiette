class Dashboard::ApplicationController < ApplicationController
  before_action :authenticate_user!, :redirect_if_admin

  private

  def redirect_if_admin
    redirect_to admin_root_path and return if current_user.admin?
  end
end
