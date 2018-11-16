class HostsController < ApplicationController
  respond_to :html, :js, only: [:index]

  add_breadcrumb I18n.t('menu.hosts'), :hosts_path

  def index
    @cities = City.active
    @users = User.hosts.page params[:page]
  end

  def city
    @city = City.find_by slug: params[:city_slug]
    @users = @city.hosts.page params[:page]
    add_breadcrumb @city
  end
end
