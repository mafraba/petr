class OrganisationsController < ApplicationController
  def index
  	@organisations = Organisation.including_profile.order('profiles.name ASC')
  end
end
