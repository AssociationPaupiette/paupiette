class UsersController < ApplicationController
  def show
    @user = User.find_by(slug: params[:user_slug])
    redirect_to root_path and return if @user.nil?

    if @user.latitude.present? && @user.longitude.present?
      @map_center = { latitude: @user.reduced_latitude, longitude: @user.reduced_longitude }.to_json
    end

    @review = User::Review.new about: @user
    add_breadcrumb @user
  end
end
