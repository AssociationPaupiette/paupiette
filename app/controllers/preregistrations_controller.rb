class PreregistrationsController < ApplicationController
  def create
    @preregistration = Preregistration.new preregistration_params
    if @preregistration.save
      flash[:notice] = 'Votre préinscription est enregistrée'
    else
      flash[:warning] = 'Problème: votre préinscription n\'a pas pu être enregistrée'
    end
    redirect_to root_path
  end

  private

  def preregistration_params
    params.require(:preregistration).permit(:first_name, :email, :city_id)
  end
end