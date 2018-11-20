class MyCities::ActivityController < MyCities::ApplicationController
  add_breadcrumb I18n.t('menu.my_cities.activity')

  def index
    @cities = current_user.managed_cities
  end
end
