class AmbassadorsController < ApplicationController
  def index
    @ambassadors = User.ambassadors.page(params[:page]).per(3)
  end
end
