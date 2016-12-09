//= require jquery
//= require jquery_ujs
//= require jquery.remotipart
//= require turbolinks
//= require_directory .
//= require_self

document.addEventListener("turbolinks:click", function() {console.log("---------------------------------------------\nclick")});
document.addEventListener("turbolinks:before-visit", function() {console.log("before-visit")});
document.addEventListener("turbolinks:visit", function() {console.log("visit")});
document.addEventListener("turbolinks:request-start", function() {console.log("request-start")});
document.addEventListener("turbolinks:request-end", function() {console.log("request-end")});

// load
// < "app request visit"
// click
// before-visit
// request-start
// visit
// request-end
// before-cache
// before-render
// render
// load
// < "end of app request"

// < "app request visit (cached)"
// click
// before-visit
// request-start
// visit
// before-cache
// before-render (render from cache)
// render        (render from cache)
// request-end
// before-render (render from source)
// render				 (render from source)
// load
// < "end of app request (cached)"

// < "restoration visit"
// visit
// before-cache
// before-render
// render
// load
// < "end of restoration"

////////////////////////////////////
// professors_tool application.js
////////////////////////////////////

NodeList.prototype.includes = function( other_node ) {
	var match_found = false;
	this.forEach(function( this_node ) {
		if(this_node.innerHTML == other_node.innerHTML) {
			match_found = true;
		}
	});

	return match_found;
};



var current_blocks = null;

// READY
$(document).ready(function( ) {
	console.log("ready");

	$('#page').isotope({
	  layoutMode: 'packery',
	  itemSelector: '.block',
	  percentPosition: true,
	  packery: {
	    columnWidth: '.grid-sizer',
			gutter: 3
	  }
	});

	current_blocks = document.querySelectorAll(".block");
	console.log("- current_blocks: ");
	console.log(current_blocks);
}); //end ready

// LOAD
document.addEventListener("turbolinks:load", function() {
	console.log("load");
	current_blocks = document.querySelectorAll(".block");
	console.log("- current_blocks: ");
	console.log(current_blocks);


	$(".block").click(function( ) {
		$(".block--width2").each(function( ) {
			this.className = this.className.replace(/\b\s?(block--width2)\b/g, '');
		});

		if( ! /grid-sizer/.test(this.className) && ! /form/.test(this.className) ) {
			this.className += " block--width2";
		}
	});

	console.log("- performing layout");
	$("#page").isotope('layout');
}); //end load


// BEFORE RENDER
document.addEventListener("turbolinks:before-render", function() {
	console.log("before-render");

	var new_blocks = event.data.newBody.querySelectorAll(".block");

	console.log("- current_blocks: " + current_blocks.length);
	console.log("- new_blocks: " + new_blocks.length);

	new_blocks.forEach(function( node ) {
		if(current_blocks.includes(node)) {
			//new block is a current block that's staying
			console.log("- node staying");
		} else {
			//new block is new
			console.log("- new node");
			node.style.display = "none";
			node.className += " appear";
			$("#page").append(node);
		}
	});

	current_blocks.forEach(function( current_block ) {
		if(! new_blocks.includes(current_block)) {
			//current block isn't a new block so it's leaving
			console.log("- node leaving");
			current_block.className += " disappear";
		}
	});

}); //end before render listener


// RENDER
document.addEventListener("turbolinks:render", function() {
	console.log("render");

	console.log("- " + $(".appear").size( ) + " nodes to appear");
	console.log("- " + $(".disappear").size( ) + " nodes to disappear");

	// $(".appear").fadeIn("slow");
	$("#page").isotope('insert', $(".appear"));

	$(".disappear").fadeOut("slow", function( ) {
		$("#page").isotope( 'remove', this ); //.isotope('layout');
		document.getElementById("page").removeChild(this);

		console.log("- remove node: " + this);

		current_blocks = document.querySelectorAll(".block");
		console.log("- rebuild node list");
		console.log(current_blocks);
		$("#page").isotope('layout');
	});

	$(".appear, .disappear").each(function( ) {
		this.className = this.className.replace(/\b\s?((dis)?appear)\b/g, '');
	});
}); //end render



// jQuery.ajaxSetup({
//   'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
// })
//
// jQuery.fn.submitWithAjax = function( ) {
//   this.submit(function( ) {
//     $.post(this.action, $(this).serialize(), null, "script");
//     return false;
//   })
//   return this;
// };
//
// jQuery.fn.reorderTable = function( url, token ) {
// 	this.tableDnD({
// 		onDrop: function(table, row) {
// 			$.ajax({
// 				type: "POST",
// 				url: url,
// 				processData: false,
// 				data: $.tableDnD.serialize() + '&authenticity_token=' + encodeURIComponent(token),
// 				dataType: "script"
// 			});
// 		}
// 	});
// };
//
// $(document).ready(function( ) {
// 	$("#new_objective").submitWithAjax( );
// 	$("#new_syllabus_part").submitWithAjax( );
// 	$("#new_requirement").submitWithAjax( );
// }); //end document ready
//
// function check_for_ie( ) {
// 	if( jQuery.support.opacity ) {
// 		$("#ie_warning").hide( );
// 	} else {
// 		$("#ie_warning").show( );
// 	}
// }
