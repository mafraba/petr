class ProfilesController < ApplicationController
  # CanCan will automatically load and authorise the profile (RESTFul style)
  load_and_authorize_resource  

  def update
    if @profile.update(profile_params)
      # If a logo was attached
      if params[:profile][:logo_file_name]
        # This is where paperclip expects the original picture
        paperclip_file_path = "profiles/logos/#{@profile.id}/original/#{params[:profile][:logo_file_name]}"
        # This is where it actually is right now (temporal location)
        pic_source = params[:profile][:logo_file_path]
        # Now copy from temp location to where paperclip expects it to be
        copy_and_delete paperclip_file_path, raw_source
      end
      # Redirect finally
      redirect_to @profile, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  private ############################################################################

  # Never trust parameters from the scary internet, only allow the white list through.
  def profile_params
    params.require(:profile).permit(:name, :organisation_id, :description, :logo)
  end

  # Move S3 object
  def copy_and_delete(paperclip_file_path, raw_source)
    s3 = AWS::S3.new
    destination = s3.buckets[AWS_CONFIG['bucket']].objects[paperclip_file_path]
    sub_source = CGI.unescape(raw_source)
    # The file_path ends up adding an extra "/" in the beginning. We remove this.
    sub_source.slice!(0)
    source = s3.buckets[AWS_CONFIG['bucket']].objects["#{sub_source}"]
    # copy_to is a method originating from the aws-sdk gem
    source.copy_to(destination)
    # delete temp file
    source.delete
  end
end
