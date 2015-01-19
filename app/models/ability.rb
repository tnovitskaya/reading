class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role.admin?
      can :manage, :all
    else
      can [:read, :create], :all
      can :create, Interest
      can [:update, :destroy], Interest do |interest|
        interest.try(:user) == user
      end
      can [:update, :destroy], Comment do |comment|
        comment.try(:user) == user
      end      
    end
  end

end