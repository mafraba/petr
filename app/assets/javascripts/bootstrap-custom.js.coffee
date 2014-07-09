do_on_load = () ->  
  # Enable dismissal of an alert
  $('button.close').attr('data-dismiss','alert')
  # Enable fade animation when closing alerts
  $('.flash-alert, .flash-notice').addClass('fade in')
  # Enable dropdowns
  $('.dropdown-toggle').dropdown()

#$(document).ready(do_on_load);
$(window).bind('page:change', do_on_load);