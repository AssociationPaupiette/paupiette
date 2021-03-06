class MyCities::ApplicationController < ApplicationController
  before_action :redirect_if_unauthorized
  before_action :load_city

  def index
    @cities = current_user.managed_cities
    render 'my_cities/index'
  end

  protected

  def load_city
    @city = City.find_by(slug: params[:city_slug])
    add_breadcrumb I18n.t('my_cities.name'), :my_cities_root_path
    add_breadcrumb @city unless @city.nil?
  end

  def redirect_if_unauthorized
    redirect_to :root unless can? :manage, :city
  end
end
