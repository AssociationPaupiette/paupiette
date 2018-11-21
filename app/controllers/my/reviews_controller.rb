class My::ReviewsController < My::ApplicationController
  add_breadcrumb I18n.t('my.reviews')

  def index
    @conversations = current_user.conversations
  end

  def save
    @user = User.find_by(slug: params[:user_slug])
    @review = current_user.review_about(@user)
    @review.text = params[:user_review][:text]
    @review.approved = false
    @review.save
    flash[:notice] = 'Votre avis va être relu par un ambassadeur avant publication'
    redirect_to my_reviews_path
  end
end
