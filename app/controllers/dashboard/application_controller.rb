class Dashboard::ApplicationController < ApplicationController
  add_breadcrumb 'Mon espace', :dashboard_root_path

  def index
    redirect_to :dashboard_messages
  end
end
