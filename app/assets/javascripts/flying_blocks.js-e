NodeList.prototype.includes = function( other_node ) {
	var match_found = false;
	this.forEach(function( this_node ) {
		if(this_node.innerHTML == other_node.innerHTML) {
			match_found = true;
		}
	});

	return match_found;
};


// FLYING BLOCKS ------------------------
var FlyingBlocks = {
	// store all blocks on the current page to be compared with new blocks loaded to
	// determine what's new and will appear, what's the same and will stay, and
	// what is leaving and will disappear
	current_blocks : [],
	refresh_timer : null,


	on : function( ) {
		// NOT CURRENTLY USED
		// document.addEventListener("turbolinks:click", function() {console.log("---------------------------------------------\nclick")});
		// document.addEventListener("turbolinks:before-visit", function() {console.log("before-visit")});
		// document.addEventListener("turbolinks:visit", function() {console.log("visit")});
		// document.addEventListener("turbolinks:request-start", function() {console.log("request-start")});
		// document.addEventListener("turbolinks:request-end", function() {console.log("request-end")});

		// READY
		$(document).ready(function( ) {
			console.log("ready");
			FlyingBlocks.init( );
		}); //end ready

		//RESIZE
		$(window).resize(function( ) {
			console.log("--- resized");
			FlyingBlocks.delayed_refresh( );
		});

		// LOAD
		document.addEventListener("turbolinks:load", FlyingBlocks.load);

		// BEFORE RENDER
		document.addEventListener("turbolinks:before-render", FlyingBlocks.before_render);

		// RENDER
		document.addEventListener("turbolinks:render", FlyingBlocks.render);


		FlyingBlocks.init( );
	}, //end on


	off : function( ) {
		console.log("shutting down isotope");
		$('#page').isotope('destroy');

		// LOAD
		document.removeEventListener("turbolinks:load", FlyingBlocks.load);

		// BEFORE RENDER
		document.removeEventListener("turbolinks:before-render", FlyingBlocks.before_render);

		// RENDER
		document.removeEventListener("turbolinks:render", FlyingBlocks.render);
	}, //end off


	//INIT
	init : function( ) {
		$('#page').isotope({
		  layoutMode: 'packery',
		  itemSelector: '.block',
		  percentPosition: true,
		  packery: {
		    columnWidth: '.grid-sizer',
				gutter: 5
		  }
		});

		FlyingBlocks.record_current_blocks( );
	}, //end init


	//RECORD CURRENT BLOCKS
	record_current_blocks : function( ) {
		FlyingBlocks.current_blocks = document.querySelectorAll(".block");
		// console.log("- current_blocks: ");
		// console.log(current_blocks);
	}, //end record_current_blocks


	//LOAD
	load : function( ) {
		console.log("load");

		FlyingBlocks.record_current_blocks( );

		// $(".block").click(function( ) {
		// 	$(".block--width2").each(function( ) {
		// 		this.className = this.className.replace(/\b\s?(block--width2)\b/g, '');
		// 	});
		//
		// 	if( ! /grid-sizer/.test(this.className) && ! /form/.test(this.className) ) {
		// 		this.className += " block--width2";
		// 	}
		// });

		FlyingBlocks.refresh( );
		FlyingBlocks.init_elements( );
	}, //end load


	//BEFORE_RENDER
	before_render : function(event) {
		console.log("before-render");

		var new_blocks = event.data.newBody.querySelectorAll(".block");

		console.log("- current_blocks: " + FlyingBlocks.current_blocks.length);
		console.log("- new_blocks: " + new_blocks.length);

		new_blocks.forEach(function( node ) {
			if(FlyingBlocks.current_blocks.includes(node)) {
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

		FlyingBlocks.current_blocks.forEach(function( current_block ) {
			if(! new_blocks.includes(current_block)) {
				//current block isn't a new block so it's leaving
				console.log("- node leaving");
				current_block.className += " disappear";
			}
		});
	}, //end before_render


	//RENDER
	render : function( ) {
		console.log("render");

		console.log("- " + $(".appear").size( ) + " nodes to appear");
		console.log("- " + $(".disappear").size( ) + " nodes to disappear");

		$("#page").isotope('insert', $(".appear"));

		$(".disappear").fadeOut("slow", function( ) {
			$("#page").isotope( 'remove', this );
			document.getElementById("page").removeChild(this);

			console.log("- remove node: " + this);

			FlyingBlocks.record_current_blocks( );
			FlyingBlocks.refresh( );
		});

		$(".appear, .disappear").each(function( ) {
			this.className = this.className.replace(/\b\s?((dis)?appear)\b/g, '');
		});
	}, //end render


	//PROCESS FORM
	process_form : function( form_partial, success_url ) {
		Turbolinks.clearCache();

		$('.form').fadeOut('slow', function( ) {
			$('#page').isotope( 'remove', $('.form') );
			$('.form').remove( );
			console.log('-- removed');

			if(success_url == 'failed') {
				//alert("failed");
				$('#page').append(form_partial);
				console.log('-- appended');
				$('#page').isotope('insert', $('.form'));

				//new/modified form block won't be removed on next nav unless it's in current blocks so rebuild current_blocks here
				FlyingBlocks.record_current_blocks( );
				FlyingBlocks.init_elements( );
				FlyingBlocks.refresh( );

			} else {
			  // alert("sent!");
				console.log("-- visiting " + success_url);
			  Turbolinks.visit(success_url);
			}
		});
	}, //end process_form


	//INIT_ELEMENTS
	init_elements : function( ) {
		//prep remoteipart forms
		$("form").on("ajax:remotipartComplete", function(e, data){
			//detect when remote form was submitted using the remotipart gem/technique
			console.log("remotipart complete:");
		  console.log(e, data);
		});


		$(".block").each( function( ) {
			//look for and execute any scripts included with blocks
			if( $(this).data("script") ) {
				console.log("*** script detected with node: " + $(this).data("script"));
				eval($(this).data("script"));
			}
		});

		// $(".block").css("transform", "scale(1)");
		//
		// var subjects = [];
		// var scale_factor = 15;
		// //get all of the full names from the current URL (in order)
		// window.location.pathname.match(/\/(\w+)\/?/g).forEach(function(val) {
		// 	subjects.push(val.replace(/\//g,''));
		// });
		//
		// for (var i = 0 ; i < subjects.length ; i++) {
		// 	var classname = "." + subjects[i];
		// 	$(classname).each(function( ) {
		// 		var scale = 1.15-(((subjects.length - i) * scale_factor)/100.0);
		// 		console.log("scaling " + classname + " to " + scale)
		// 		// $(this).css("transform", "scale(" + scale + ")");
		// 		$(this).addClass("smaller");
		// 	});
		// }

	}, //end init_elements


	//REFRESH
	refresh : function( ) {
		console.log("- refreshing layout");

		FlyingBlocks.sort( );
		FlyingBlocks.update_layout( );
	}, //end refresh


	//DELAYED REFRESH
	delayed_refresh : function( ) {
		console.log("- refreshing layout (delayed)");

		if(FlyingBlocks.refresh_timer == null)
			FlyingBlocks.refresh_timer = setTimeout("FlyingBlocks.update_layout( )", 1500);
	}, //end refresh

	//SORT
	sort : function( ) {
		$("#page").isotope({
			getSortData: {
		    active: function( block ) {
		    	var val = $(block).data("active");
					if( val ) {
						return val;
					} else {
						return "active";
					}
		    }
			},

			// sortAscending: {
			// 	active: true
			// },

			sortBy: [ 'active' ]
		});
		$("#page").isotope('updateSortData');
	}, //end sort


	//UPDATE_LAYOUT
	update_layout : function( ) {
		$("#page").isotope('layout');
		FlyingBlocks.refresh_timer = null;
	} //end update_layout
}; //end FlyingBlocks
