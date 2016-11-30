# 
# Animate tabs
# 

$(document).ready ->
	animate_tabs( )
	
$(document).on('page:load', -> animate_tabs( ))

$(document).on "turbolinks:load", -> animate_tabs( )

animate_tabs = ->
	if are_animations_on( )
		$(".flash").each ->
			console.log "flash message present"
			tab = $(this)

			console.log "tab top: " + $(tab).offset( ).top + " tab left: " + $(tab).offset( ).left

			# hide tab
			$(tab).css "position", "relative"
			$(tab).css "left", -$(tab).outerWidth( true ) - 20
		
			# reveal( tab )
			setTimeout( ->
				reveal_with_position( tab, "left" )
			,2000 )

		# left tabs #######################
		$("#semester_sections li:even, #assignments li, #assignments_header, #assignment_objective, #assignment_instructions, #assignment_instructions_header, #assignment_extras li, #assignment_extras_header, #syllabus, form ol li, #course_materials li:even, #section_examples li:even, #tutorial_step, #next_prev li.prev, #semesters li:even, #instructors li:even, #instructor_header, #instructor_details, #courses li:even, #disclaimer, #course_description_header, #course_description, #course_objectives_header, #course_objectives, #course_labs_header, #course_labs li, #no_assignments, #admin_semesters li").each ->
			tab = $(this)

			console.log "top: #{$(tab).offset( ).top} tab left: #{$(tab).offset( ).left} tab "

			# hide tab
			$(tab).css "position", "relative"
			amount = -$(tab).outerWidth( true ) - 160
			$(tab).css "left", amount

			# reveal( tab )
			setTimeout( ->
				# reveal_with_position( tab, "left" )
				reveal_with_css3( tab, -amount )
			,(Math.random( ) * 1000) )

		# right tabs #######################	
		$("#semester_sections li:odd, #section_links li, #tutorials li, #assignment_links li, #requirements_header, #requirements, #course_materials li:odd, #section_examples li:odd, #next_prev li.next, #semesters li:odd, #instructors li:odd, #courses li:odd, #course_links li, #past_sections li").each ->
			tab = $(this)

			console.log "top: #{$(tab).offset( ).top} tab left: #{$(tab).offset( ).left} tab "

			# hide tab
			$(tab).css "position", "relative"
			amount = -$(tab).outerWidth( true ) - 160

			if is_iphone( ) # everything is left aligned in iphone layout
				$(tab).css "left", amount
			else
				$(tab).css "right", amount

			# reveal( tab )
			setTimeout( ->
				if is_iphone( ) # everything is left aligned in iphone layout
					# reveal_with_position( tab, "left" )
					reveal_with_css3( tab, -amount )
				else
					# reveal_with_position( tab, "right" )
					reveal_with_css3( tab, amount )
				(Math.random( ) * 1000) )

reveal_with_position = ( tab, direction ) ->
	console.log "revealing " + $(tab)

	# animate position
	if direction == "left"
		$(tab).animate {left: 0}, (Math.random( ) * 1500), "easeInOutCirc"
	else
	$(tab).animate {right: 0}, (Math.random( ) * 1500), "easeInOutCirc"


reveal_with_css3 = ( tab, amount ) ->
	console.log "revealing #{$(tab)} amount: #{amount}"

	$(tab).css "-webkit-transform", "translateX(#{amount}px)";
	$(tab).css "-webkit-transition", "-webkit-transform #{Math.random( )}s ease-in-out";

	$(tab).css "-moz-transform", "translateX(#{amount}px)";
	$(tab).css "-moz-transition", "-moz-transform #{Math.random( )}s ease-in-out";

	$(tab).css "-o-transform", "translateX(#{amount}px)";
	$(tab).css "-o-transition", "-o-transform #{Math.random( )}s ease-in-out";

	$(tab).css "-ms-transform", "translateX(#{amount}px)";
	$(tab).css "-ms-transition", "-ms-transform #{Math.random( )}s ease-in-out";

	$(tab).css "transform", "translateX(#{amount}px)";
	$(tab).css "transition", "transform #{Math.random( )}s ease-in-out";
