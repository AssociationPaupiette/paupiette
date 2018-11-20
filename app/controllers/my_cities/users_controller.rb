class MyCities::UsersController < MyCities::ApplicationController
  def approval
    @city = City.find_by(slug: params[:city_slug])
    @users = @city.users.to_approve
    add_breadcrumb @city
    add_breadcrumb t('menu.my_cities.users_to_approve')
  end
end