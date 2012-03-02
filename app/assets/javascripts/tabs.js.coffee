# 
# Animate tabs
# 

$(document).ready ->
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
		$("#semester_sections li:even, #assignments li, #assignments_header, #assignment_objective, #assignment_instructions, #assignment_instructions_header, #assignment_extras li, #assignment_extras_header, #syllabus, form li, #course_materials li:even, #section_examples li:even, #tutorial_step, #next_prev li.prev, #semesters li:even, #instructors li:even, #instructor_header, #instructor_details, #courses li:even, #disclaimer, #course_description_header, #course_description, #course_objectives_header, #course_objectives, #course_labs_header, #course_labs li, #no_assignments").each ->
			tab = $(this)
		
			console.log "top: #{$(tab).offset( ).top} tab left: #{$(tab).offset( ).left} tab "

			# hide tab
			$(tab).css "position", "relative"
			$(tab).css "left", -$(tab).outerWidth( true ) - 160
		
		
			# reveal( tab )
			setTimeout( ->
				reveal_with_position( tab, "left" )
			,(Math.random( ) * 1000) )
		
		# right tabs #######################	
		$("#semester_sections li:odd, #section_links li, #tutorials li, #assignment_links li, #requirements_header, #requirements, #course_materials li:odd, #section_examples li:odd, #next_prev li.next, #semesters li:odd, #instructors li:odd, #courses li:odd, #course_links li, #past_sections li").each ->
			tab = $(this)
		
			console.log "top: #{$(tab).offset( ).top} tab left: #{$(tab).offset( ).left} tab "

			# hide tab
			$(tab).css "position", "relative"
			$(tab).css "right", -$(tab).outerWidth( true ) - 160
		
		
			# reveal( tab )
			setTimeout( ->
				reveal_with_position( tab, "right" )
			,(Math.random( ) * 1000) )
			
		


reveal_with_position = ( tab, direction ) ->
	console.log "revealing " + $(tab)

	# animate position
	if direction == "left"
		$(tab).animate {left: 0}, (Math.random( ) * 1500), "easeInOutCirc"
	else
		$(tab).animate {right: 0}, (Math.random( ) * 1500), "easeInOutCirc"

