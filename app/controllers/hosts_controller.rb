class HostsController < ApplicationController
  respond_to :html, :js, only: [:index]

  add_breadcrumb I18n.t('menu.hosts'), :hosts_path

  def index
    @cities = City.active
    @users = User.hosts.approved.page params[:page]
    @meals = Meal.opened
    @map_center = { latitude: 46.8506542, longitude: 3.9984845 }.to_json
    @users_active = @users.map { |user|
      { latitude: user.reduced_latitude, longitude: user.reduced_longitude, url: user_path(user_slug: user.slug) }
    }.to_json
  end

  def city
    @city = City.find_by slug: params[:city_slug]
    @users = @city.hosts.approved.page params[:page]
    @meals = @city.meals.opened
    @map_center = { latitude: @city.latitude, longitude: @city.longitude }.to_json
    @users_active = @users.map { |user|
      { latitude: user.reduced_latitude, longitude: user.reduced_longitude, url: user_path(user_slug: user.slug) }
    }.to_json
    add_breadcrumb @city
  end
end
