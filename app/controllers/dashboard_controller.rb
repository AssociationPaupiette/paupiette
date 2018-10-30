class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to admin_root_path and return if current_user.admin?

    @user = current_user
    @tab = params[:tab]
    @tab ||= "profile"
  end

  def update_profile
    @user = current_user
    @user.assign_attributes(user_params)
    if @user.valid?(:update_profile)
      @user.save
      redirect_to dashboard_path
    else
      render "dashboard/index"
    end
  end

  private

  def user_params
    params[:user][:reception_days] ||= []
    params.require(:user).permit(:first_name, :city_id, :description, :photo,
                                 :specialties, :identity_card, reception_days: [])
  end
end
