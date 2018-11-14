class Admin::PreregistrationsController < Admin::ApplicationController
  add_breadcrumb 'Préinscriptions', :admin_preregistrations_path

  def index
    @preregistrations = Preregistration.all
  end

  def import
    Preregistration.import params[:csv]
    redirect_to admin_preregistrations_path, notice: 'Données importées'
  end
end