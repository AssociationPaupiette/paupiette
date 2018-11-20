class MyCities::UsersController < MyCities::ApplicationController
  before_action :load_city

  def approval
    @users = @city.users.to_approve
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

  def unapprove
    @user = User.find_by slug: params[:user_slug]
    if !@user.nil? && @user.city.in?(current_user.managed_cities)
      @user.approved = false
      @user.save
      flash[:notice] = 'Utilisateur désapprouvé'
    else
      flash[:notice] = 'Problème technique'
    end
    redirect_to my_cities_root_path
  end

  def hosts
    @users = @city.users.hosts.page params[:page]
    add_breadcrumb t('menu.my_cities.hosts')
  end

  def guests
    @users = @city.users.guests.page params[:page]
    add_breadcrumb t('menu.my_cities.guests')
  end

  protected

  def load_city
    @city = City.find_by(slug: params[:city_slug])
    add_breadcrumb @city
  end
end