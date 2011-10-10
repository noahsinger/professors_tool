//= require jquery  
//= require jquery_ujs
//= require jquery.easing
//= require jquery.tablednd_0_5
//= require jquery.jgrowl
//= require_self  
//= require jquery.kwicks
//= require positionFooter.jQuery
//= require chrome

// require_tree .

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

// function setup_search_field( ) {
// 	$("#search").css( "width", 110 );
// 	$("#q").css( "width", 65 );
// 	
// 	$("#q").focus( function( ) {
// 		if( $(this).attr("value") == "Search ..." ) {
// 			$(this).attr("value", "");
// 		}
// 		
// 		$("#search").animate( {width: 550}, 500 );
// 		$(this).animate( {width: 500}, 500 );
// 		
// 		$("#page, #footer, #top_bar").animate( {opacity: '.2'}, 500 );
// 	});
// 	
// 	$("#q").blur( function( ) {
// 		if( $(this).attr("value") == "" ) {
// 			$(this).attr("value", "Search ...");
// 		}
// 
// 		$("#search").animate( {width: 110}, 500 );
// 		$(this).animate( {width: 65}, 500 );
// 		
// 		$("#page").animate( {opacity: '1'}, 500 );
// 		$("#footer, #top_bar").animate( {opacity: '.8'}, 500 );
// 	});
// }
