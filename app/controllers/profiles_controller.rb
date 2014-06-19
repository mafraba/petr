class ProfilesController < ApplicationController
  # CanCan will automatically load and authorise the profile (RESTFul style)
  load_and_authorize_resource

  def update
    if @profile.update(profile_params)
      redirect_to @profile, notice: 'Profile was successfully updated.'
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
