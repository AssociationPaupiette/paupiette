class AmbassadorsController < ApplicationController
  add_breadcrumb 'Ambassadeurs'

  def index
    @users = User.ambassadors.page params[:page]
  end
end
