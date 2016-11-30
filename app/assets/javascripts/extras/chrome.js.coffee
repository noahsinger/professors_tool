setup_fields = ->
	# center fields vertically on their tabs
	$("li input[type=text], li input[type=email], li input[type=password]").each ->
		# unless it's an iphone in portrait orientation
		unless is_iphone( ) && (window.orientation == 0 || window.orientation == 180)
			field = this
			li = $(field).parents( "li" )
			li_height = $(li).outerHeight()
			field_height = $(field).outerHeight(true)
		
			top = (li_height - field_height) / 2
			$(field).css("position", "relative")
			$(field).css("top", "#{top}px")
		else
			field = this
			$(field).css("position", "static")
			$(field).css("top", "0px")



# $(document).ready ->
# 	setup_fields( )
#
# $(document).on('page:load', -> setup_fields( ))
#
$(document).bind "orientationchange", ->
	setup_fields( )
	
$(document).on "turbolinks:load", ->
	setup_fields( )
	
