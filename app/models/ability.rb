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
    # can :manage, Message, user: @user
  end

  def host
    # TODO: Meal model
    # can :manage, Meal, user: @user
  end

  def ambassador
    can :verify, User, city_id: @user.managed_cities.pluck(:id)
  end

  def admin
    can :manage, :all
  end
end
