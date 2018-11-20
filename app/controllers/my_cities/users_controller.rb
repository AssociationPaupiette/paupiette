class MyCities::UsersController < MyCities::ApplicationController
  def approval
    @city = City.find_by(slug: params[:city_slug])
    @users = @city.users.to_approve
    add_breadcrumb @city
    add_breadcrumb t('menu.my_cities.users_to_approve')
  end

  def approve
    @user = User.find_by slug: params[:user_slug]
    if !@user.nil? && @user.city.in?(current_user.managed_cities)
      @user.approved = true
      @user.save
      flash[:notice] = 'Utilisateur approuvé'
    else
      flash[:notice] = 'Problème technique'
    end
    redirect_to my_cities_users_approval_path(city_slug: params[:city_slug])
  end
end