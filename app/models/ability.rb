class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # in case of guest
    if user.has_role? :admin
      can :manage, :all
    else
      can :read, :all
  end
  end
end