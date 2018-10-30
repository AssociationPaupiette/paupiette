class Admin::UsersController < Admin::ApplicationController

  def index
    @users = User.all.page params[:page]
  end

end