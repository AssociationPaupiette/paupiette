class MyCities::UsersController < MyCities::ApplicationController

  def index
    @users = @city.users.guests.page params[:page]
    add_breadcrumb t('my_cities.users.guests')
  end

  def hosts
    @users = @city.users.hosts.page params[:page]
    add_breadcrumb t('my_cities.users.hosts')
  end

  def approval
    @users = @city.users.to_approve
    add_breadcrumb t('my_cities.users.to_approve')
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
end