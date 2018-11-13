class HomeController < ApplicationController
  def index
    @preregister = Preregister.new
    @cities = City.inactive
  end
end