class Admin::CitiesController < Admin::ApplicationController
  load_and_authorize_resource

  add_breadcrumb 'Villes', :admin_cities_path

  def index
    @cities = City.all
  end

  def new
    @city = City.new
    add_breadcrumb 'Nouvelle ville'
  end

  def show
    add_breadcrumb @city
  end

  def preregistrations
    add_breadcrumb @city, [:admin, @city]
    add_breadcrumb 'Préinscriptions'
    @preregistrations = @city.preregistrations
  end

  def ambassadors
    add_breadcrumb @city, [:admin, @city]
    add_breadcrumb 'Ambassadeurs'
    @users = @city.ambassadors.page params[:page]
  end

  def guests
    add_breadcrumb @city, [:admin, @city]
    add_breadcrumb 'Convives'
    @users = @city.guests.page params[:page]
  end

  def hosts
    add_breadcrumb @city, [:admin, @city]
    add_breadcrumb 'Hôtes'
    @users = @city.hosts.page params[:page]
  end

  def edit
    add_breadcrumb @city, [:admin, @city]
    add_breadcrumb 'Modifier'
  end

  def create
    @city = City.new city_params
    if @city.save
      redirect_to [:admin, @city], notice: 'La ville a été créée'
    else
      add_breadcrumb 'Nouvelle ville'
      render :new
    end
  end

  def update
    @city.update city_params
    if @city.save
      redirect_to [:admin, @city], notice: 'La ville a été modifiée'
    else
      add_breadcrumb 'Modifier'
      render :edit
    end
  end

  private

  def city_params
    params.require(:city).permit(:name, :active, :latitude, :longitude)
  end

end