class Admin::UsersController < Admin::ApplicationController
  load_and_authorize_resource

  add_breadcrumb 'Utilisateurs', :admin_users_path

  def index
    @admins = User.admins
    @ambassadors = User.ambassadors
    @guests = User.guests
    @hosts = User.hosts
  end

  def admins
    add_breadcrumb 'Administrateurs'
    @users = User.admins.page params[:page]
  end

  def ambassadors
    add_breadcrumb 'Ambassadeurs'
    @users = User.ambassadors.page params[:page]
  end

  def guests
    add_breadcrumb 'Convives'
    @users = User.guests.page params[:page]
  end

  def hosts
    add_breadcrumb 'Hôtes'
    @users = User.hosts.page params[:page]
  end

  def search
    add_breadcrumb 'Recherche'
    @users = User.search(params[:term])
  end

  def new
    @user = User.new
    add_breadcrumb 'Nouvel utilisateur'
  end

  def show
    add_breadcrumb @user
  end

  def edit
    add_breadcrumb @user, [:admin, @user]
    add_breadcrumb 'Modifier'
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to [:admin, @user], notice: 'L\'utilisateur a été créé'
    else
      # FIXME password empty prevents from saving
      add_breadcrumb 'Nouvel utilisateur'
      render :new
    end
  end

  def update
    @user.update user_params
    if @user.save
      redirect_to [:admin, @user], notice: 'L\'utilisateur a été modifié'
    else
      add_breadcrumb 'Modifier'
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :slug, :address, :zipcode, :city_id,
      :host, :admin, :active, :approved, :profile_verification, :description, :photo, :specialties, :identity_card,
      reception_days: [], managed_city_ids: [])
  end
end