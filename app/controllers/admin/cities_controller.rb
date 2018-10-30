class Admin::CitiesController < Admin::ApplicationController

  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

end