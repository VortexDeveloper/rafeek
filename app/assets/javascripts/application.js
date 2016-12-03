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
//= require bootstrap.min
//= require jquery_payment.min
//= require accounting.min

$(function() {
  $("#raffles th a, #raffles .pagination a").on("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#raffles_search input").keyup(function() {
    $.get($("#raffles_search").attr("action"), $("#raffles_search").serialize(), null, "script");
    return false;
  });
});

function normal_height(container) {
  var biggestHeight = 0;
  // Loop through elements children to find & set the biggest height

  $(container).each(function(){
    // If this elements height is bigger than the biggestHeight
    if ($(this).height() > biggestHeight ) {
     // Set the biggestHeight to this Height
     biggestHeight = $(this).height();
    }
  });

  // Set the container height
  $(container).height(biggestHeight);
}
