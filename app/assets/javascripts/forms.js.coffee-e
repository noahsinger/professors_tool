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
	$( "#file_upload_image" ).remove()
	$( "#file_upload_filename" ).remove()
	
	$("div.filename").prepend( "<span id=\"file_upload_filename\" style=\"display: none;\">#{filename}</span>" )
	$("div.filename span").fadeIn( 'slow' )
	$(div).prepend( "<img id=\"file_upload_image\" src=\"/assets/mimes/#{image}.png\" alt=\"#{filename}\" style=\"display: none;\"/>" )
	$(div).find( "img" ).fadeIn( 'slow' )


setup_forms = ->
	# setup image drop in file fields
	$("input[type=file]").each ->
		field = this
		div = $(field).parents( "div.file:first" )
		
		is_firefox = navigator.userAgent.toLowerCase().indexOf('firefox') > -1
		if is_firefox
			field.size = "1" 
			field.style.left = "-20px"
			field.style.top = "-46px"
		
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
		


$(document).ready ->
	setup_forms( )
	
$(document).on('page:load', -> setup_forms( ))
	
$(document).bind "orientationchange", ->
	setup_forms( )
	#check_for_upload_support( )
