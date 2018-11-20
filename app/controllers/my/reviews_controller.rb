class My::ReviewsController < My::ApplicationController
  add_breadcrumb I18n.t('menu.my.reviews')

  def index
    @conversations = current_user.conversations
  end
end
