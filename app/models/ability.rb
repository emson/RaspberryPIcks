class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    user ||= User.new # guest user (not logged in)

    if user.try(:role) == 'admin'
      can :manage, :all
      can :create, Post

    elsif user.try(:role) == 'member'
      can :read, :all
      can :create, Post
      can :update, Post do |post|
        # can only edit user's own post
        user.try(:posts).find(post.id) == post
      end

      can :create, Vote
      can :destroy, Vote do |vote|
        # can only delete user's own vote
        vote.user == user
      end

    else
      can :read, :all
    end

    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
