class PagesController < ApplicationController

  def index
    @preregistration = Preregistration.new
    @preregistration_cities = City.inactive

    @map_center = { latitude: 46.71109, longitude: 1.7191036 }.to_json
    @map_cities = City.active.map { |city|
      { latitude: city.latitude, longitude: city.longitude, url: city_hosts_path(city.slug) }
    }.to_json
  end

  def press
    add_breadcrumb t('menu.press')
  end

  def who
    add_breadcrumb t('menu.who')
  end

  def legal
    add_breadcrumb t('menu.legal')
  end
end