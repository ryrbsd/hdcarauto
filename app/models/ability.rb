class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, CaseType # allow everyone to read everything
    can :read, ServiceCase
    can :read, CompanyNews
    if user && user.role != "user"
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :dashboard                  # allow access to dashboard
      can :manage, CaseType # allow everyone to read everything
      can :manage, ServiceCase
      can :manage, CompanyNews 
      can :manage, PopProduct
      # if user.role == 'developer'
      #   can :manage, :all             # allow superadmins to do anything
      # elsif user.role == 'superadmin'
      #   can :manage, :all
      #   cannot :edit, User do |people|
      #     people.role == 'superadmin' && people != user
      #   end
      # elsif user.role == 'admin'
      #   # this is amazing!!!
      #   if(user.authority)
      #     model_list = ''
      #     access_list = user.authority.split(',')
      #     access_list.each do |k|
      #       model_list += user.hashmap[k] 
      #       model_list += ','
      #     end
      #     model_list = eval model_list.to_s.split(',').each {|n| n}.to_s.gsub('"', '')
      #     can :manage, model_list
      #   end
      # end
    end
  end
    
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
end
