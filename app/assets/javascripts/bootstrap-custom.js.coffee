do_on_load = () ->  
  # Enable dismissal of an alert
  $('button.close').attr('data-dismiss','alert')
  # Enable fade animation when closing alerts
  $('.flash-alert, .flash-notice').addClass('fade in')

#$(document).ready(do_on_load);
$(window).bind('page:change', do_on_load);