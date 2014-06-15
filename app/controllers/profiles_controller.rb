class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit]

  def edit
  end

  private ############################################################################

  # Use callbacks to share common setup or constraints between actions.
  def set_profile
    @profile = Profile.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def animal_params
    params.require(:profile).permit(:name, :organisation_id, :description)
  end
end
