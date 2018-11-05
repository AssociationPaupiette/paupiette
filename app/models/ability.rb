class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user ||= User.new

    guest
    host if @user.host?
    ambassador if @user.ambassador?
    admin if @user.admin?
  end

  protected

  def guest
    can :manage, Message, from: @user
  end

  def host
    can :manage, Meal, host: @user
  end

  def ambassador
    can :manage, :city
    can :verify, User, city_id: @user.managed_cities.pluck(:id)
  end

  def admin
    can :manage, :all
  end
end
