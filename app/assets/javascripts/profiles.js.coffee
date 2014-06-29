# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $("#s3-uploader").S3Uploader
    allow_multiple_files: true
  $('#s3-uploader').bind "s3_upload_complete", (e, content) ->
    alert("Success! -> #{content.url}")
  $('#s3-uploader').bind "s3_upload_failed", (e, content) ->
    alert("#{content.filename} failed to upload : #{content.error_thrown}")

