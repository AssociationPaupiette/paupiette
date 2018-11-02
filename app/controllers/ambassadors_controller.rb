class AmbassadorsController < ApplicationController
  add_breadcrumb 'Ambassadeurs'

  def index
    @ambassadors = User.ambassadors.page params[:page]
  end
end
