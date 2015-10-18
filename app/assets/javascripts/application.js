//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_self

var ready = function() {
  $('.new_question_link').click(function(){
    $(this).hide().append().after("<div class='reponse'>↳ | C'est bon !</div>");
  });
  $('.feedback_box').hide();
  $('.feedback_link').click(function(){
    $(".feedback_box").toggle();
    return false
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);