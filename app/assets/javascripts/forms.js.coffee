# disable submit button to avoid multiple form submissions
$(document).ready ->
  $("form input[type=submit]").each ->
    $(this).click ->
      this.disabled = true
      $(this).parents('form:first').submit( )
