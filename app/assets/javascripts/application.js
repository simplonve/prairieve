//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_self

$(document).ready(function(){
  $('.feedback_box').fadeOut("fast");
  $('#feedback_link').click(function(){
    $(this).next().toggle(function(event){
      event.preventDefault();
    });
  });
});