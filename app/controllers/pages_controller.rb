class PagesController < ApplicationController

  def index
    @preregistration = Preregistration.new
    @preregistration_cities = City.inactive
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