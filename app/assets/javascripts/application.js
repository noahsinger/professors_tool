//= require jquery  
//= require jquery_ujs
//= cookie_tools
//= require animation_toggle
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

function is_iphone( ) {
	return navigator.userAgent.match(/iPhone/i) != null
}

function is_ipad( ) {
	return navigator.userAgent.match(/iPad/i) != null
}

$(document).ready(function( ) {	
	$("#new_objective").submitWithAjax( );
	$("#new_syllabus_part").submitWithAjax( );
	$("#new_requirement").submitWithAjax( );
		
	//check_for_ie( );
	
	//check_for_upload_support( ); //iOS9 now allows uploads from conected cloud services
}); //end document ready

function check_for_upload_support( ) {
	var isiDevice = is_ipad( ) || is_iphone( );
	console.log( "Is this an iDevice..." + isiDevice );
	if( $("form div.file").size( ) > 0 && isiDevice ) {
		console.log( "disabling file fields" );
		$("form div.file").each( function( ) {
			this.style.display = "none";
		});
		
		$("form div.filename").each( function( ) {
			this.innerHTML = "This device does not support uploads";
			//if it's an iphone in portrait orientation
			if( is_iphone( ) && (window.orientation == 0 || window.orientation == 180) ) {
				this.style.width = "100%";
				this.style.marginTop = "10px";
				this.style.marginLeft = "20px";
				this.style.marginBottom = "20px";
			} else {
				this.style.width = "80px";
				this.style.marginTop = "53px";
				this.style.marginLeft = "10px";
				this.style.marginBottom = "0";
			}
		});
	}
}

function check_for_ie( ) {
	if( jQuery.support.opacity ) {
		$("#ie_warning").hide( );
	} else {
		$("#ie_warning").show( );
	}
}

// function add_syllabus_part( url, id, token ) {
// 	$.post(url, "syllabus_part_id=" + id + '&authenticity_token=' + encodeURIComponent(token), null, "script");
// }

// function add_tutorial( url, id, token ) {
// 	$.post(url, "how_to_id=" + id + '&authenticity_token=' + encodeURIComponent(token), null, "script");
// }
