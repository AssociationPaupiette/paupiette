class Dashboard::ProfileController < Dashboard::ApplicationController
  def index
    @user = current_user
  end

  def update
    @user = current_user
    @user.assign_attributes(user_params)
    if @user.valid?(:update_profile)
      @user.save
      redirect_to dashboard_root_path
    else
      render "index"
    end
  end

  private

  def user_params
    params[:user][:reception_days] ||= []
    params.require(:user).permit(:first_name, :last_name, :city_id, :description, :photo,
                                 :specialties, :identity_card, reception_days: [])
  end
end
