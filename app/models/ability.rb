class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    else
      # Polls 
      can :read, Poll
      can :create, Poll
      can :update, Poll do |poll|
        poll.try(:user) == user
      end
      can :destroy, Poll do |poll|
        poll.try(:user) == user
      end
      can :create_question, Poll do |poll|
        poll.try(:user) == user
      end
    end
  end
end
