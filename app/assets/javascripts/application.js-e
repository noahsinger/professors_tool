//= require jquery  
//= require jquery_ujs
//= require turbolinks
//= require_directory .
//= require_self

// require_tree . //disabled

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
}); //end document ready

function check_for_ie( ) {
	if( jQuery.support.opacity ) {
		$("#ie_warning").hide( );
	} else {
		$("#ie_warning").show( );
	}
}
