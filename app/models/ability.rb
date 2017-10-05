class Ability
  include CanCan::Ability

  def initialize(user)
    # TODO: add this when admin will be add
    # if user.admin?
    #   can :manage, :all
    # else
    can [:update, :destroy], Room do |room|
      room.user == user
    end
    # end
  end
end
