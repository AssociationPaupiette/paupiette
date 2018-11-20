class UsersController < ApplicationController
  def show
    @user = User.find_by(slug: params[:user_slug])
    @review = User::Review.new about: @user
    redirect_to root_path and return if @user.nil?
    add_breadcrumb @user
  end
end
