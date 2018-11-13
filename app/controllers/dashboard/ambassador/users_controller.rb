class Dashboard::Ambassador::UsersController < Dashboard::Ambassador::ApplicationController
  def pending
    @city = City.find_by(slug: params[:city_slug])
    @users = @city.users.profile_verification_pending
    add_breadcrumb 'Utilisateurs en attente'
  end
end