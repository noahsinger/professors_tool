# 
# Animate tabs
# 

$(document).ready ->
	$(".flash").each ->
		console.log "flash message present, setting timeout"
		# reveal( $(this) )
		setTimeout( ->
			reveal( this )
		,1000 )


reveal = ( tab ) ->
	console.log "revealing " + $(tab)

	console.log "tabs outer width: " + $(tab).outerWidth( true )
	final_width = $(tab).outerWidth( true ) #true includes margin
	height = $(tab).height( )
	$(tab).css( "height", height )
	$(tab).css( "overflow", "hidden" )
	$(tab).css( "width", 0 )
	console.log "animating"
	$(tab).animate {width: final_width}, 1000
	return
