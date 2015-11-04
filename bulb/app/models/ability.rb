class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.email?
      can [:create], :all
      can :read, Idea do |idea|
        idea.user.company.try(:id) == user.company.id
      end
      can :read, User do |u|
        user.company == u.company
      end
      # can :read, User do |user|
      #   current_user.company.try(:id) == user.company.id
      # end
      can :manage, Idea do |idea|
        idea.try(:user) == user
      end
    end 
  end

end
