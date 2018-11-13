class HomeController < ApplicationController
  def index
    @preregistration = Preregistration.new
    @preregistration_cities = City.inactive
  end
end