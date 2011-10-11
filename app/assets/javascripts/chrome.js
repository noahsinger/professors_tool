// non required visual effects

$(document).ready(function( ) {	
	set_backbar_height( );
	
	submit_button_replace( "Please Wait..." );
	hideable_submit_buttons( );
	
	stripe_tables( );
	
	mark_error_fields( );
	
	$('ul.nav').kwicks({  
        max : 250,  
        spacing : 6,
		duration: 1300 ,
		easing: 'easeOutBounce'
    });

	$('ul.nav li a').focus( function( ){
		$(this).css( "marginTop", "10px" );
	});
	
	ul_hover( );
	
	remove_navigation_hyphens( );
	add_navigation_glyphs( );
	
	setTimeout('$("#flash").slideDown( )', 1000);
	
	$("#footer").positionFooter();
});

function add_navigation_glyphs( ) {
	$("div.nav ul li a span.text").each( function( ) {
		if( this.firstChild.data == "Back  " ) {
			$(this).parent( ).append( '<span class="icon">&lArr;</span>' );
		} else if( this.firstChild.data == "Syllabus  " ) {
			$(this).parent( ).append( '<span class="icon">&para;</span>' );
		} else if( this.firstChild.data == "Grades  " ) {
			$(this).parent( ).append( '<span class="icon">?</span>' );
		} else if( this.firstChild.data == "Edit  " ) {
			$(this).parent( ).append( '<span class="icon">&euml;</span>' );
		} else if( this.firstChild.data == "New  " ) {
			$(this).parent( ).append( '<span class="icon">&#241;</span>' );
		} else if( this.firstChild.data == "Show  " ) {
			$(this).parent( ).append( '<span class="icon">&ocirc;</span>' );
		} else if( this.firstChild.data == "Assignments" ) {
			$(this).parent( ).append( '<span class="icon">&aring;</span>' );
		} else if( this.firstChild.data == "Email Section" ) {
			$(this).parent( ).append( '<span class="icon">&ecirc;</span>' );
		} else if( this.firstChild.data == "Submit  " ) {
			$(this).parent( ).append( '<span class="icon">&sect;</span>' );
		} else if( this.firstChild.data == "Return  " ) {
			$(this).parent( ).append( '<span class="icon">&darr;</span>' );
		} else if( this.firstChild.data == "Print  " ) {
			$(this).parent( ).append( '<span class="icon">&thorn;</span>' );
		}						
	});
}

function remove_navigation_hyphens( ) {
	$("div.nav ul li a span.text") .each( function( ) {
		this.firstChild.data = this.firstChild.data.replace( "-", "" );
	});
}

function ul_hover( ) {
	$("ul.sliding li").each( function( i ) {
		$(this).hover(
			function( ) {
				$(this).animate({ marginLeft: -50, paddingLeft: 225 }, 150 );
			},		
			function( ) {
				$(this).animate({ marginLeft: 0, paddingLeft: 175 }, 150);
			}
		);
	});
	
	$("ol li.submit_bar div#submit_div").each( function( i ) {
		$(this).hover(
			function( ) {
				$(this).animate({ marginLeft: -50, paddingLeft: 50 }, 150 );
			},		
			function( ) {
				$(this).animate({ marginLeft: 0, paddingLeft: 0 }, 150);
			}
		);
	});
	
	$("ol li.submit_bar div#submit_div a").each( function( i ) {
		$(this).focus(
			function( ) {
				$(this).parent( ).animate({ marginLeft: -50, paddingLeft: 50 }, 150 );
				$(this).parent( ).css( "backgroundColor", "orange" );
			}
		);
		
		$(this).blur(
			function( ) {
				$(this).parent( ).animate({ marginLeft: 0, paddingLeft: 0 }, 150);
				$(this).parent( ).css( "backgroundColor", "#111" );
			}
		);
	});
}

function submit_button_replace( waiting_text ) {
	var inputs = document.getElementsByTagName( "input" );
	if( inputs.length > 0 ) {
		for( var x = 0 ; x < inputs.length ; x++ ) {
			if( inputs[ x ].type == "submit" ) {
				
				if( inputs[x].name == "commit") {
					var div = document.createElement( "div" );
					div.setAttribute( "id", "submit_div" );
					
					var text = document.createTextNode( waiting_text );
					var waiting_div = document.createElement( "div" );
					waiting_div.setAttribute( "id", "waiting_div" );
					var wspan = document.createElement( "span" );
					wspan.appendChild( text );
					waiting_div.appendChild( wspan );
					
					var parent = inputs[x].parentNode;
										
					var link = document.createElement( "a" );
					link.setAttribute( "href", "javascript:void( );" );
					link.setAttribute( "id", "submit_link" );
					link.appendChild( document.createTextNode(inputs[x].value) );
					
					link.onclick = function( ) {
						$("form").submit( );
					}
											
					div.appendChild( link );
					parent.appendChild( div );
					parent.appendChild( waiting_div );
					
					$("input[type=text],input[type=password],select").keydown( function( event ) {
						if(event.keyCode==13) {
							$("form").submit( );
						}
					});
				}
			}
		}
	}
}

function hide_submit_button( ) {
	$("#submit_div a").fadeOut( 100 );
	$("#submit_div").css("height", 40);
	$("#submit_div").animate( {width: 0, padding: 0}, 1000 );
	
	$("#waiting_div").animate( {width: 300, paddingLeft: 20}, 1000 );
	$("#waiting_div span").fadeIn( );
}

function hideable_submit_buttons( ) {
	$("form").submit( function( ) {
		hide_submit_button( );
	});
}

function stripe_tables( ) {
	$('table').each( function( ) {
		if( this.className != 'ui-datepicker-calendar' ) {
			$(this).find( "tr:odd" ).each( function( ) {
				$(this).addClass("alt");
			});
		}
	});
}

function pre_print( ) { 
	$("#header").slideUp( "slow" );
	$("#top_bar").slideUp( "slow" );
	$("div.nav").slideUp( "slow" );
	$("#footer").slideUp( "slow" );
	$("#back_bar").slideUp( "slow" );
	$("#page").animate( {marginLeft: 10}, 1000 );
	$("#content").animate( {paddingLeft: 0}, 1000 );
	
	setTimeout('window.print( )', 2000);
	
	setTimeout( 'post_print( )', 10000 );
}

function post_print( ) {
	$("#header").slideDown( "slow" );
	$("#top_bar").slideDown( "slow" );
	$("div.nav").slideDown( "slow" );
	$("#footer").slideDown( "slow" );
	$("#back_bar").slideDown( "slow" );
	$("#page").animate( {marginLeft: 150}, 1000 );
	$("#content").animate( {paddingLeft: 180}, 1000 );
}

function mark_error_fields( ) {
	$(".fieldWithErrors").each( function( x ) {
		$(this).parent().addClass("red_bg");
	});
}

function toggle_monitoring_instructions( ) {
	$('#monitor_instructions').toggle( "slow" );

	if( $('#toggle_monitoring_instructions_link').html( ) == "Cancel" )
		$('#toggle_monitoring_instructions_link').html('help');
	else
		$('#toggle_monitoring_instructions_link').html('Cancel');
}

function set_backbar_height( ) {
	$("#back_bar").animate({ height: $(document).height( )}, 1000, 'swing');
}
