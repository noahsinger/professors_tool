//= require jquery
//= require jquery_ujs
//= require jquery.remotipart
//  require jquery-ui
//= require jquery-ui/widgets/datepicker
//= require turbolinks
//= require_directory .
//= require_self

////////////////////////////////////
// professors_tool application.js
////////////////////////////////////

FlyingBlocks.on( );

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
