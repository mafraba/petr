# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

do_on_load = () ->  
  # Set up the upload form
  $("#s3-uploader").S3Uploader
    progress_bar_target: $('#progress-meters')
    remove_completed_progress_bar: false
    allow_multiple_files: false
  # Set up progress bars' modal
  $('#uploads').attr('data-reveal','')
  $('#uploads').foundation('reveal', {
    close_on_background_click: false, 
    close_on_esc: false
  })
  # When all uploads are finished...
  # $(document).bind 's3_uploads_complete', ->
  #
  # When uploads begin, show progress bar
  $('#s3-uploader').bind 's3_uploads_start', (e) ->
    $('#uploads').foundation('reveal', 'open');  
  # When an upload fails show error
  $('#s3-uploader').bind "s3_upload_failed", (e, content) ->
    alert("#{content.filename} failed to upload : #{content.error_thrown}")
  # Clicking on logo on edit page should trigger logo upload dialog
  #$('#logo-edit').unbind('click')  # necessary if both document.ready and bind to page:change
  $('#logo-edit').click ->
    $('#file').click()

#$(document).ready(do_on_load);
$(window).bind('page:change', do_on_load);
