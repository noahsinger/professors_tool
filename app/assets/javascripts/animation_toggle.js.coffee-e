# control for the animation toggle link

$(document).ready ->
	if are_animations_on( )
		create_animation_link( "on" )
		write_cookie( "animation_setting", "on" )
	else
		create_animation_link( "off" )
		write_cookie( "animation_setting", "off" )
	
		
create_animation_link = (setting) ->
	$("#animation_link_item").each ->
		link = $('<a href="#"></a>')
		
		console.log "Creating animations link #{link}"
		
		if setting == "on"
			link.text( "Turn Animations Off" )
		else
			link.text( "Turn Animations On" )
		
		$(this).html(link)
		
		link.click ->
			toggle_animations( );
			false


toggle_animations = ->
	if are_animations_on( )
		create_animation_link( "off" )
		write_cookie( "animation_setting", "off" )
	else
		create_animation_link( "on" )
		write_cookie( "animation_setting", "on" )
	

window.are_animations_on = ->
	animation_setting = find_cookie( "animation_setting" )
	if animation_setting == null
		if is_iphone( ) || is_ipad( )
			return false
		else
			return true
	else if animation_setting == "on"
		return true
	else if animation_setting == "off"
		return false
