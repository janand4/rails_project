# app/views/sites/update_cities.js.coffee
  

  $("#cities_select").empty().append("<%= escape_javascript(render(:partial => @cities)) %>")