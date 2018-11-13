class MyCities::UsersController < MyCities::ApplicationController
  def pending
    @city = City.find_by(slug: params[:city_slug])
    @users = @city.users.profile_verification_pending
    add_breadcrumb @city
    add_breadcrumb t('menu.my_cities.users_pending')
  end
end