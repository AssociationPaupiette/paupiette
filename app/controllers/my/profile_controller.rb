class My::ProfileController < My::ApplicationController
  add_breadcrumb I18n.t('menu.my.profile')

  def index
    @user = current_user
  end

  def update
    @user = current_user
    @user.assign_attributes(user_params)
    if @user.valid?(:update_profile)
      @user.save
      redirect_to :my_profile, notice: 'Profil mis à jour'
    else
      render :index
    end
  end

  private

  def user_params
    params[:user][:reception_days] ||= []
    params.require(:user).permit(:first_name, :last_name, :email, :slug, :city_id, :description,
                                 :photo, :specialties, :identity_card, reception_days: [])
  end
end
