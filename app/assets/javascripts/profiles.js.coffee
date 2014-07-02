# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $("#s3-uploader").S3Uploader
    progress_bar_target: $('#uploads')
  $(document).bind 's3_uploads_complete', ->
    $('#uploads').foundation('reveal', 'close');
  $('#s3-uploader').bind "s3_upload_failed", (e, content) ->
    alert("#{content.filename} failed to upload : #{content.error_thrown}")
  $('#s3-uploader').bind 's3_uploads_start', (e) ->
    $('#uploads').foundation('reveal', 'open');
  return null
