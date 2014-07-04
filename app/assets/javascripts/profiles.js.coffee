# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

do_on_load = () ->  
  # Set up the upload form
  $("#s3-uploader").S3Uploader
    progress_bar_target: $('#uploads')
    remove_completed_progress_bar: true
    allow_multiple_files: false
  # Set up progress bars' modal
  $('#uploads').attr('data-reveal','')
  $('#uploads').foundation('reveal', {close_on_background_click: false})
  # When all uploads are finished, hide the progress bars
  $(document).bind 's3_uploads_complete', ->
    $('#uploads').foundation('reveal', 'close');
  # When uploads begin, show progress bar
  $('#s3-uploader').bind 's3_uploads_start', (e) ->
    $('#uploads').foundation('reveal', 'open');  
  # When an upload fails show error
  $('#s3-uploader').bind "s3_upload_failed", (e, content) ->
    alert("#{content.filename} failed to upload : #{content.error_thrown}")

$(document).ready(do_on_load);
$(window).bind('page:change', do_on_load);
