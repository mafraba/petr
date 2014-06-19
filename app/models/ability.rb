class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. 
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities

    user ||= Organisation.new # guest user (not logged in)

    # General READ permission
    can :read, :all

    # A profile can only be edited/updated by the organisation it belongs to    
    can :edit, Profile, organisation_id: user.id
    can :update, Profile, organisation_id: user.id
  end
end
