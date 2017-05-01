// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require waypoints.min
//= require jquery.cookie
//= require modernizr
//= require bootstrap-hover-dropdown
//= require owl.carousel.min
//= require front
//= require social-share-button
//= require application

$( document ).ready(function() {
  geolocation();
});

function geolocation() {
  if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(post_position);
  }

  function post_position(position)
  {
    latitude = position['coords'].latitude
    longitude = position['coords'].longitude
    post_lat_long(latitude,longitude)

    function post_lat_long(latitude, longitude){
       var post_set_location = window.location.href + 'set-location?lat='+ latitude + '&long='+ longitude
       $.post(post_set_location, function(json) {
        });
    }
  }
}

function busca_cep(cep){
  url = "https://viacep.com.br/ws/"+cep+"/json/"
  $.getJSON( url, function( data ) {
    return data;
  });
}
