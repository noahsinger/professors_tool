pre_print = ->
	timer = 1000
	$("#page").animate {
		opacity: 0
	}, timer, ->
		$(document.body).addClass( "print" )
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
		$("#page").animate {
			opacity: 1
		}, timer, ->
			$("#page").unbind( "click" )
	
$(document).ready ->
	$("#print").click -> 
		pre_print( )
