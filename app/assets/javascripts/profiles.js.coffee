# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

do_on_load = () ->  
  # Set up the upload form
  $("#s3-uploader").S3Uploader
    progress_bar_target: $('#uploads')
    remove_completed_progress_bar: false
    allow_multiple_files: false
  # When all uploads are finished, hide the progress bars
  $(document).bind 's3_uploads_complete', ->
    $('#uploads').foundation('reveal', 'close');
  # When uploads begin, show progress bar
  $('#s3-uploader').bind 's3_uploads_start', (e) ->
    $('#uploads').foundation('reveal', 'open');  
  # When an upload fails show error
  $('#s3-uploader').bind "s3_upload_failed", (e, content) ->
    alert("#{content.filename} failed to upload : #{content.error_thrown}")  
  # When the upload is completed, save the values to submit later
  $('#s3_uploader').bind 's3_upload_complete', (e, content) ->    
    $('#logo_file_name').val(content.filename);
    $('#logo_file_path').val(content.filepath);
    $('#logo_file_size').val(content.filesize);
    $('#logo_content_type').val(content.filetype);  

$(document).ready(do_on_load);
$(window).bind('page:change', do_on_load);
