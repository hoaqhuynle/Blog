class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
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
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    
    user ||= User.new
    if user.has_role? :admin
      can :manage, :all # admin có tất cả các quyền
    elsif user.has_role? :user
      # can :create, Article # user can create Article
      # can [:update,:destroy], Article do |article|
      #       article.user_id == user.id # User chỉ có thể update và destroy article của chính mình.
      # end
      can :manage, Article, user_id: user.id
      can :manage, Comment, user_id: user.id

      can :create, Article
      can :create, Comment

      can :read, :all
    else
      can :read, :all
    end

  end
end
