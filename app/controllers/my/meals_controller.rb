class My::MealsController < My::ApplicationController
  load_and_authorize_resource

  add_breadcrumb I18n.t('my.meals.name'), :my_meals_path

  def index
    @meals = current_user.meals
  end

  def new
    add_breadcrumb t('my.meals.new')
  end

  def edit
    add_breadcrumb t('my.meals.edit')
  end

  def create
    @meal = Meal.new meal_params
    if @meal.save
      redirect_to :my_meals, notice: t('my.meals.saved')
    else
      render :new
    end
  end

  def update
    @meal.update user_params
    if @user.save
      redirect_to [:admin, @user], notice: 'L\'utilisateur a été modifié'
    else
      add_breadcrumb 'Modifier'
      render :edit
    end
  end

  def destroy
    @meal.destroy
    redirect_to my_meals_path, notice: 'Repas annulé'
  end

  private

  def meal_params
    params.require(:meal)
          .permit(:date, :capacity)
          .merge({host_id: current_user.id})
  end
end
