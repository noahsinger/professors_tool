pre_print = ->
	timer = 1000
	$("#page").animate {
		opacity: 0
	}, timer, ->
		$(document.body).addClass( "print" )
		FlyingBlocks.off( )
		$("#page").animate {
			opacity: 1
		}, timer, ->
			$("#page").click ->
				post_print( )
	false
	

post_print = ->
	timer = 1000
	$("#page").animate {
		opacity: 0
	}, timer, ->
		$(document.body).removeClass( "print" )
		FlyingBlocks.on( )
		$("#page").animate {
			opacity: 1
		}, timer, ->
			$("#page").unbind( "click" )
			FlyingBlocks.on( )


setup_print_link = ->
	$("#print").click -> 
		pre_print( )

		
$(document).ready ->
	setup_print_link( )

$(document).on('page:load', -> setup_print_link( ))

$(document).on "turbolinks:load", ->
	setup_print_link( )
