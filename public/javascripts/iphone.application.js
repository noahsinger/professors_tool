$(document).ready(function( ) {	
	stripe_lists( );
	add_arrows( );
}); //end document ready

function stripe_lists( ) {
	$('ul li:even').addClass('alt');
}
 
function add_arrows( ) {
	$('ul li a').each( function( ) {
		$(this).prepend( '<span class="arrow"><img src="/images/iPhoneArrow.png" alt=""/></span>' );		
	});
	
	$("ul li a span.arrow").each( function( ) {
		var img_h = 13;
		var top = ($(this).parent( ).height( ) - img_h) / 2;
		$(this).css( "marginTop", top );
	});
}

