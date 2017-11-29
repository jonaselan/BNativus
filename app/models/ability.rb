class Ability
  include CanCan::Ability

  def initialize(user)
    # TODO: add this when admin will be add
    # if user.admin?
    #   can :manage, :all
    # else
    can [:show, :destroy, :edit], User do |uu|
      uu == user
    end

    can [:edit, :update, :destroy], Room do |room|
      room.user == user
    end

    can [:edit, :update, :destroy], Posting do |posting|
      posting.user == user
    end

    # end
  end
end
