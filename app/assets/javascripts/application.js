//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_self

$(document).ready(function(){
  $('.feedback_box').hide();
  $('.feedback_link').click(function(){
    $(".feedback_box").toggle();
    return false
  });
});