class MyCities::ReviewsController < MyCities::ApplicationController
  def index
    @reviews = @city.reviews.page params[:page]
    add_breadcrumb t('my_cities.reviews.name')
  end

  def approval
    @reviews = @city.reviews.unapproved.page params[:page]
    add_breadcrumb t('my_cities.reviews.to_approve')
  end

  def approve
    @review = User::Review.find params[:id]
    @review.approved = true
    @review.save
    flash[:notice] = 'Avis approuvé'
    redirect_to my_cities_reviews_approval_path(city_slug: params[:city_slug])
  end

  def unapprove
    @review = User::Review.find params[:id]
    @review.approved = false
    @review.save
    flash[:notice] = 'Avis désapprouvé'
    redirect_to my_cities_reviews_path(city_slug: params[:city_slug])
  end
end