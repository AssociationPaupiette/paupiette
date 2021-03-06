class Admin::ApplicationController < ApplicationController
  before_action :authenticate_user!
  
  layout 'admin/layouts/application'

  add_breadcrumb 'Admin', :admin_root_path

  rescue_from CanCan::AccessDenied do |exception|
    render file: "#{Rails.root}/public/403", formats: [:html], status: 403, layout: false
  end
end
