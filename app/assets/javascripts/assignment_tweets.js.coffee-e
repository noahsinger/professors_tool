# assignment tweets

# $(document).ready ->
$(document).on "turbolinks:load", ->
	$("textarea#content").each ->
		console.log "content textarea present"
		field = $("textarea#content")
		output = $("span#character_count")
		
		show_count(field,output)
		
		field.keyup ->
			show_count(field,output)
			
show_count = (field, output) ->
	text = field.val( )
	console.log( "content length is " + text.length )
	output.text( "#{text.length} used, #{(120-text.length)} remaining" )
	if text.length > 120
		field.css "color", "red"
	else
		field.css "color", "#fff"
