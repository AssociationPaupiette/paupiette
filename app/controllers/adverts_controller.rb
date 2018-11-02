class AdvertsController < ApplicationController
  respond_to :html, :js, only: [:index]

  add_breadcrumb 'Annonces', :adverts_path

  def index
    @cities = City.active
    @hosts = User.hosts.page params[:page]
  end

  def city
    @city = City.find_by slug: params[:city_slug]
    @hosts = @city.hosts.page params[:page]
    add_breadcrumb @city
  end
end
