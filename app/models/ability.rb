class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # guest user
    
    if user.role? :admin
      can :manage, :all
    else
      can :read, :all
      #can :create, Task
      #can :update, Task do |comment|
      #  comment.try(:user) == user || user.role?(:manager)
      #end
      #if user.role?(:audit)
      #  can :create, Article
      #  can :update, Article do |article|
      #    article.try(:user) == user
      #  end
      #end
    end
  end
end


