//= require jquery  
//= require jquery_ujs
//= require_self
//= require_tree .

////////////////////////////////////
// Ingenio.us.com Application.js
////////////////////////////////////

jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

jQuery.fn.submitWithAjax = function( ) {
  this.submit(function( ) {
    $.post(this.action, $(this).serialize(), null, "script");
    return false;
  })
  return this;
};

jQuery.fn.reorderTable = function( url, token ) {
	this.tableDnD({
		onDrop: function(table, row) {
			$.ajax({
				type: "POST",
				url: url,
				processData: false,
				data: $.tableDnD.serialize() + '&authenticity_token=' + encodeURIComponent(token),
				dataType: "script"
			});
		}
	});
};

$(document).ready(function( ) {	
	$("#new_objective").submitWithAjax( );
	$("#new_syllabus_part").submitWithAjax( );
	$("#new_requirement").submitWithAjax( );
	
	// replace_crud_links( );
	// setup_search_field( );
	check_for_ie( );
}); //end document ready

function check_for_ie( ) {
	if( jQuery.support.opacity ) {
		$("#ie_warning").hide( );
	} else {
		$("#ie_warning").show( );
	}
}

function add_syllabus_part( url, id, token ) {
	$.post(url, "syllabus_part_id=" + id + '&authenticity_token=' + encodeURIComponent(token), null, "script");
}

function add_tutorial( url, id, token ) {
	$.post(url, "how_to_id=" + id + '&authenticity_token=' + encodeURIComponent(token), null, "script");
}

function replace_crud_links( ) {
	$('table tr td a').each( function( ) {
		if( $(this).html( ) == 'Destroy' ) {
			$(this).html( '<span class="delete_link">&#10006;</span>' );
		}
		
		if( $(this).html( ) == 'Edit' ) {
			$(this).html( '<span class="edit_link">&#9998;</span>' );
		}

		if( $(this).html( ) == 'Show' ) {
			$(this).html( '<span class="show_link">&#9732;</span>' );
		}
	});
}
