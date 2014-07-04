class ProfilesController < ApplicationController
  # CanCan will automatically load and authorise the profile (RESTFul style)
  load_and_authorize_resource

  def update
    # If a logo was attached
    if params[:tmp_logo_upload_path]
      # This is where paperclip expects the original picture
      paperclip_file_path = "profiles/logos/#{@profile.id}/original"
      # This is where it actually is right now (temporal location)
      pic_source = params[:tmp_logo_upload_path]
      # Now copy from temp location to where paperclip expects it to be
      copy_and_delete paperclip_file_path, pic_source
      # Grab info from s3
      upload_head = s3.buckets[AWS_CONFIG[:bucket]].objects[paperclip_file_path].head
      self.logo_file_name     = pic_source
      self.logo_file_size     = upload_head.content_length
      self.logo_content_type  = upload_head.content_type
      self.logo_updated_at    = upload_head.last_modified
      # Reprocess to generate styles
      @profile.logo.reprocess!
      @profile.save
    elsif @profile.update(profile_params)
      # Redirect finally
      redirect_to @profile, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  private ############################################################################

  # Never trust parameters from the scary internet, only allow the white list through.
  def profile_params
    params.require(:profile).permit(:name,
                                    :organisation_id,
                                    :description)
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
