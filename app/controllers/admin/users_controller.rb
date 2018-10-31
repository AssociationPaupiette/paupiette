class Admin::UsersController < Admin::ApplicationController
  load_and_authorize_resource

  add_breadcrumb 'Utilisateurs', :admin_users_path

  def index
    @users = User.all.page params[:page]
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

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :city_id, managed_city_ids: [])
  end

end