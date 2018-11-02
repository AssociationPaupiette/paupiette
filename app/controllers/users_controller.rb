class UsersController < ApplicationController
  def show
    @user = User.find_by(slug: params[:slug])
    redirect_to adverts_path and return if @user.nil?
    
    add_breadcrumb @user
  end
end
