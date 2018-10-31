class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user ||= User.new

    send :host if @user.host?
    send :ambassador if @user.ambassador?
    send :admin if @user.admin?
  end

  protected

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
