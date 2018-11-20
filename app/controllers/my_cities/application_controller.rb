class MyCities::ApplicationController < ApplicationController
  before_action :redirect_if_unauthorized

  add_breadcrumb I18n.t('menu.my_cities.name'), :my_cities_root_path

  def index
    @cities = current_user.managed_cities
    render 'my_cities/index'
  end

  private

  def redirect_if_unauthorized
    redirect_to :root unless can? :manage, :city
  end
end
