class UsersController < ApplicationController
  def show
    @user = User.find_by(slug: params[:user_slug])
    @map_center = { latitude: 48.8695998, longitude: 2.3202199}.to_json
    @review = User::Review.new about: @user
    redirect_to root_path and return if @user.nil?
    add_breadcrumb @user
  end
end
