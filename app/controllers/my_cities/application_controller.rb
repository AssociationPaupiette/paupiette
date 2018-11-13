class MyCities::ApplicationController < ApplicationController
  before_action :redirect_if_unauthorized

  add_breadcrumb I18n.t('menu.my_cities.name'), :my_cities_root_path

  def index
    redirect_to :my_cities_activity
  end

  private

  def redirect_if_unauthorized
    redirect_to :root unless can? :manage, :city
  end
end
