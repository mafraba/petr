class ProfilesController < ApplicationController

  def edit
    @profile = Profile.where(organisation: current_organisation).first
  end

  def update
  	@profile = Profile.where(organisation: current_organisation).first
    if @profile.update(profile_params)
      redirect_to root_path, notice: 'Profile was successfully updated.' 
    else
      render :edit 
    end
  end

  private ############################################################################

  # Never trust parameters from the scary internet, only allow the white list through.
  def profile_params
    params.require(:profile).permit(:name, :organisation_id, :description)
  end
end
