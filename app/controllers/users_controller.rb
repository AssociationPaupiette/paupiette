class UsersController < ApplicationController
  def show
    @user = User.find_by(slug: params[:user_slug])
    redirect_to root_path and return if @user.nil?
    
    add_breadcrumb @user
  end
end
