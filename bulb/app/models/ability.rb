class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.email?
      can [:create], :all
      can :read, Idea do |idea|
        idea.user.company.id == user.company.id
      end
      can :read, User do |u|
        user.company == u.company
      end
      can :upvote, Idea do |idea|
        idea.user.company = user.company
      end
      can :manage, Idea do |idea|
        idea.user == user
      end
    end 
  end

end
