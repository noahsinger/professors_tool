//= require jquery
//= require jquery_ujs
//= require jquery.remotipart
//  require jquery-ui
//= require jquery-ui/widgets/datepicker
//= require turbolinks
//= require_directory .
//= require_self

document.addEventListener("turbolinks:click", function() {console.log("---------------------------------------------\nclick")});
document.addEventListener("turbolinks:before-visit", function() {console.log("before-visit")});
document.addEventListener("turbolinks:visit", function() {console.log("visit")});
document.addEventListener("turbolinks:request-start", function() {console.log("request-start")});
document.addEventListener("turbolinks:request-end", function() {console.log("request-end")});


////////////////////////////////////
// professors_tool application.js
////////////////////////////////////

// READY
$(document).ready(function( ) {
	console.log("ready");
	FlyingBlocks.init( );
}); //end ready

//RESIZE
$(window).resize(function( ) {
	console.log("--- resized");
	FlyingBlocks.refresh( );
});

// LOAD
document.addEventListener("turbolinks:load", FlyingBlocks.load);

// BEFORE RENDER
document.addEventListener("turbolinks:before-render", FlyingBlocks.before_render);

// RENDER
document.addEventListener("turbolinks:render", FlyingBlocks.render);

// TURBOLINKS EVENT EXCUTION  ORDER
//
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
