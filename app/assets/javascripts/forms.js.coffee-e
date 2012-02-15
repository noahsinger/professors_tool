# 
# form related js
# 

mimes = 
	doc:  "application-msword"
	pdf:  "application-pdf"
	rss:  "application-rss+xml"
	xls:  "application-vnd.ms-excel"
	ppt:  "application-vnd.ms-powerpoint"
	"7z":   "application-x-7zip"
	gz:   "application-x-gzip"
	jar:  "application-x-jar"
	php:  "application-x-php"
	rar:  "application-x-rar"
	rb:   "application-x-ruby"
	tar:  "application-x-tar"
	zip:  "application-x-zip"
	deb:  "deb"
	font: "font-x-generic"
	gif:  "image-gif"
	jpg:  "image-jpeg"
	jpeg: "image-jpeg"
	eps:  "image-x-eps"
	psd:  "image-x-psd"
	png:  "image-x-xcf"
	rpm:  "rpm"
	css:  "text-css"
	html: "text-html"
	htm:  "text-html"
	txt:  "text-plain"
	rtf:  "text-richtext"
	bak:  "text-x-bak"
	cpp:  "text-x-c++"
	h:    "text-x-c++hdr"
	c:    "text-x-c"
	h:    "text-x-chdr"
	java: "text-x-java"
	js:   "text-x-javascript"
	py:   "text-x-python"
	bash: "text-x-script"
	tex:  "text-x-tex"
	xml:  "text-xml"
	vcal: "vcalendar"
		

# insert file images for input type=file fields
insert_image = (div, image, filename) ->
	$(div).find( ".prompt" ).remove()
	$("div.filename").prepend( "<span style=\"display: none;\">#{filename}</span>" )
	$("div.filename span").fadeIn( 'slow' )
	$(div).prepend( "<img src=\"/assets/mimes/#{image}.png\" alt=\"#{filename}\" style=\"display: none;\"/>" )
	$(div).find( "img" ).fadeIn( 'slow' )

setup_forms = ->
	$("input[type=file]").each ->
		field = this
		div = $(field).parents( "div.file:first" )
		
		div.bind 'click', ->
			field.value = ""
			# alert( "starting" )
			poll = setInterval ->
				if field.value != ""
					clearInterval( poll )
					# alert( "stopped for #{field.value}" )
					ext = field.value.substring( field.value.lastIndexOf( "." ) + 1, field.value.length ).toLowerCase( )
					# alert( ext )
					filename = field.value.substring( field.value.lastIndexOf( "\\" ) + 1, field.value.length ).toLowerCase( )
					# alert( filename )
					image = mimes[ext] || "empty"
					# alert( image )
					
					insert_image( div, image, filename )
			, 200
			
	# provide basic email address in text fields
	$("input[type=text]").each ->
		if $(this).data( "mask" )
			mask = $(this).data( "mask" )
			field = this
			
			$(field).bind 'focus', ->
				$(field).val( mask )
				
	# center fields vertically on their tabs
	$("input[type=text], input[type=password]").each ->
		# unless it's an iphone in portrait orientation
		unless is_iphone( ) && (window.orientation == 0 || window.orientation == 180)
			field = this
			li = $(field).parents( "li" )
			li_height = $(li).outerHeight()
			field_height = $(field).outerHeight(true)
		
			top = (li_height - field_height) / 2
			# alert( "input: #{field_height}\nli: #{li_height}\ntop: #{top}" )
			$(field).css("position", "relative")
			$(field).css("top", "#{top}px")
		else
			field = this
			$(field).css("position", "static")
			$(field).css("top", "0px")
		


$(document).ready ->
	setup_forms( )
	
$(document).bind "orientationchange", ->
	setup_forms( )
	check_for_upload_support( )
