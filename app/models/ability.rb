# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :admin
      p "#{user.inspect} has admin rights11"
      can :read, Account, user: user # read own accout only
      can :update, User, id: user.id # update only own detail
      #can :read, User, id: user.id # read only own detail
      can :read, User, :all #read all detail
      # can :create,Account, user: user
    else
      p "#{user.email} has not admin rights"
      cannot :update, User
      cannot :read, Account
    end

    # can :manage, Category, seller: { user: user }
    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
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
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
