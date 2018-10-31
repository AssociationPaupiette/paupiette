class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user ||= User.new
    send @user.role.to_sym unless @user.role.nil?
  end

  protected

  def guest
  end

  def host
  end

  def admin
    can :manage, :all
  end
end
