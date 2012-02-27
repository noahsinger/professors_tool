# 
# Animate tabs
# 

$(document).ready ->
	unless is_iphone( )
		$(".flash").each ->
			console.log "flash message present"
			tab = $(this)

			console.log "building blind"
			blind = $("<div></div>")
			blind.css "background-color", "#669966"
			blind.css "width", Math.abs($(tab).offset( ).left) - 1
			blind.css "height", $(tab).outerHeight( false ) + 10
			blind.css "position", "absolute"
			blind.css "z-index", "10"

			console.log "tab top: " + $(tab).offset( ).top + " tab left: " + $(tab).offset( ).left
			blind.css "top", $(tab).offset( ).top - 8
			blind.css "left", 0
			$("body").append( blind )
		
			# hide tab
			$(tab).css "position", "relative"
			$(tab).css "left", -$(tab).outerWidth( true ) - 20
		
			# reveal( tab )
			setTimeout( ->
				reveal_with_position( tab, blind )
			,2000 )



reveal_with_position = ( tab, blind ) ->
	console.log "revealing " + $(tab)

	# animate position then remove blind
	$(tab).animate {left: 0}, 500, "easeOutCirc", ->
		blind.remove( )
		console.log "blind removed"

	# animate width attempt
	# console.log "tabs outer width: " + $(tab).outerWidth( true )
	# final_width = $(tab).outerWidth( true ) #true includes margin
	# height = $(tab).height( )
	# $(tab).css( "height", height )
	# $(tab).css( "overflow", "hidden" )
	# $(tab).css( "width", 0 )
	# console.log "animating"
	# $(tab).animate {width: final_width}, 1000
	return
