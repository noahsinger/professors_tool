# 
# Animate tabs
# 

$(document).ready ->
	unless is_iphone( )
		$(".flash").each ->
			console.log "flash message present"
			tab = $(this)

			console.log "tab top: " + $(tab).offset( ).top + " tab left: " + $(tab).offset( ).left

			# hide tab
			$(tab).css "position", "relative"
			$(tab).css "left", -$(tab).outerWidth( true ) - 20
		
			# reveal( tab )
			setTimeout( ->
				reveal_with_position( tab )
			,2000 )



reveal_with_position = ( tab ) ->
	console.log "revealing " + $(tab)

	# animate position then remove blind
	$(tab).animate {left: 0}, 500, "easeOutCirc"

	# animate width attempt
	# console.log "tabs outer width: " + $(tab).outerWidth( true )
	# final_width = $(tab).outerWidth( true ) #true includes margin
	# height = $(tab).height( )
	# $(tab).css( "height", height )
	# $(tab).css( "overflow", "hidden" )
	# $(tab).css( "width", 0 )
	# console.log "animating"
	# $(tab).animate {width: final_width}, 1000
	# return
