class AdvertsController < ApplicationController
  respond_to :html, :js, only: [:index]

  def index
    @cities = City.active
    @days = Date::DAYNAMES.rotate

    @filter_city = City.find_by(id: params[:city]) unless params[:city].nil?
    @hosts = @filter_city.nil? ? User.hosts.page(params[:page]).per(3) : @filter_city.hosts.page(params[:page]).per(3)
  end
end
