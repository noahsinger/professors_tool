# cookie tools #############

window.parse_cookies = ->
	console.log document.cookie
	cookies = new Array( )
	cookie_strings = document.cookie.split( "; " )
	console.log "#{cookie_strings.length} cookies available"
	for cookie in cookie_strings
		do (cookie) ->
			cookie_parts = cookie.split( "=" )
			cookies.push( [ cookie_parts[ 0 ], cookie_parts[ 1 ] ] )
	
	console.log "#{cookies.length} cookies parsed"
	cookies
	
window.find_cookie = (cookie_name) ->
	result = null
	cookies = parse_cookies( )
	for cookie in cookies
		# console.log "looking for #{cookie_name}, found #{cookie[ 0 ]}"
		result = cookie[ 1 ] if cookie[ 0 ] == cookie_name
	result
	
window.write_cookie = (name, value) ->
	date = new Date();
	date.setTime(date.getTime()+(365*24*60*60*1000));
	
	document.cookie = "#{name}=#{value}; expires=#{date.toGMTString()}"
	console.log "Cookie written: #{name}=#{value}; expires=#{date.toGMTString()}"
