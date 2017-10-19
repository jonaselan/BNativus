class Ability
  include CanCan::Ability

  def initialize(user)
    # TODO: add this when admin will be add
    # if user.admin?
    #   can :manage, :all
    # else
    can [:edit, :update, :destroy], Room do |room|
      room.user == user
    end

    can [:show, :destroy, :edit], User do |u|
      u == user
    end
    # end
  end
end
