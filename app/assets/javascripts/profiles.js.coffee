# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

do_on_load = () ->  
  # Set up the upload form
  $("#s3-uploader").S3Uploader
    progress_bar_target: $('#progress-meters')
    remove_completed_progress_bar: false
    allow_multiple_files: false
  # Initialise modal
  $('#uploads').modal({ 
    show: false,          # so it doesn't show up inmediately
    keyboard: false,      # so it won't close on 'esc' key
    backdrop: 'static'    # so it won't close on backdrop click
  })
  # When all uploads are finished...
  # $(document).bind 's3_uploads_complete', ->
  #
  # When uploads begin, show progress bar
  $('#s3-uploader').bind 's3_uploads_start', (e) ->
    $('#uploads').modal('show');
  # When an upload fails show error
  $('#s3-uploader').bind "s3_upload_failed", (e, content) ->
    alert("#{content.filename} failed to upload : #{content.error_thrown}")
  # Clicking on logo on edit page should trigger logo upload dialog
  $('#logo-edit').click ->
    $('#file').click()

#$(document).ready(do_on_load);
$(window).bind('page:change', do_on_load);
