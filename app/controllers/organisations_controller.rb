class OrganisationsController < ApplicationController
  def index
  	@organisations = Organisation.order(:email)
  end
end
