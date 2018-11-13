class PreregistersController < ApplicationController
  def create
    @preregister = Preregister.new preregister_params
    if @preregister.save
      flash[:notice] = 'Votre préinscription est enregistrée'
    else
      flash[:warning] = 'Problème: votre préinscription n\'a pas pu être enregistrée'
    end
    redirect_to root_path
  end

  private

  def preregister_params
    params.require(:preregister).permit(:first_name, :email, :city_id)
  end
end