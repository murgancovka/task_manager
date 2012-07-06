class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # guest user
    
    if user.role? :admin
      can :manage, :all
    elsif user.role? :manager
	  can :read, Task
	  can :create, Task
      #authorize! :read, Task, :message => "Unable to read this article."
       #can :access, :home
      #authorize! :read, :all, :message => "Unable to read this article."
      #can :create, Task
	  #can :update, Task
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


