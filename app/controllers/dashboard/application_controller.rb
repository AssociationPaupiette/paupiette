class Dashboard::ApplicationController < ApplicationController
  before_action :authenticate_user!

  add_breadcrumb 'Tableau de bord', :dashboard_root_path

end
