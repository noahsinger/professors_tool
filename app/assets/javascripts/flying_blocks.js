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
	current_blocks : [],
	
	//INIT
	init : function( ) {
		$('#page').isotope({
		  layoutMode: 'packery',
		  itemSelector: '.block',
		  percentPosition: true,
		  packery: {
		    columnWidth: '.grid-sizer',
				gutter: 3
		  }
		});

		FlyingBlocks.record_current_blocks( );
	}, //end init
	
	//RECORD CURRENT BLOCKS
	record_current_blocks : function( ) {
		current_blocks = document.querySelectorAll(".block");
		console.log("- current_blocks: ");
		console.log(current_blocks);
	}, //end record_current_blocks
	
	
	//LOAD
	load : function( ) {
		console.log("load");
	
		FlyingBlocks.record_current_blocks( );

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
	
		FlyingBlocks.init_elements( );
	}, //end load
	
	
	//BEFORE_RENDER
	before_render : function( ) {
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
	}, //end before_render
	
	
	//RENDER
	render : function( ) {
		console.log("render");

		console.log("- " + $(".appear").size( ) + " nodes to appear");
		console.log("- " + $(".disappear").size( ) + " nodes to disappear");

		// $(".appear").fadeIn("slow");
		$("#page").isotope('insert', $(".appear"));

		$(".disappear").fadeOut("slow", function( ) {
			$("#page").isotope( 'remove', this );
			document.getElementById("page").removeChild(this);

			console.log("- remove node: " + this);

			FlyingBlocks.record_current_blocks( );
			$("#page").isotope('layout');
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
				$('#page').isotope('layout');
			
				FlyingBlocks.init_elements( );
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
		
		//look for and execute any scripts included with blocks
		$(".block").each( function( ) {
			if( $(this).data("script") ) {
				console.log("*** script detected with node: " + $(this).data("script"));
				eval($(this).data("script"));
			}	
		});
	} //end init_elements
}; //end FlyingBlocks
