class My::MealsController < My::ApplicationController
  load_and_authorize_resource

  add_breadcrumb I18n.t('my.meals.name'), :my_meals_path

  def index
    @meals = current_user.meals.future
  end

  def new
    add_breadcrumb t('my.meals.new')
    @meal = Meal.new capacity: 2, confirmed: 1, date: Date.tomorrow
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
    @meal.update meal_params
    if @meal.save
      redirect_to :my_meals, notice: t('my.meals.saved')
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
          .permit(:date, :capacity, :confirmed)
          .merge({host_id: current_user.id})
  end
end
