$(function(){
  var list = $('#artists-list');
  var typeList = $('#type-list');
  

  $('#artist-menu').on('click',function(){
    list.slideToggle(100);
  });
  
  $(document).on('click',function(event) {
    if(!$(event.target).closest('#artist-menu').length) {
      list.slideUp(100);
    }
    
  });

  $('#type-menu').on('click',function(){
    typeList.slideToggle(100);
  });
  $(document).on('click',function(event) {
    if(!$(event.target).closest('#type-menu').length) {
      typeList.slideUp(100);
    }
  });

  var contactBtn = $('#contact-btn');
  contactBtn.on('click',function(){
    $('#contact-form').slideToggle(200);
    $('#error').remove();
  });

  var contactBtnM = $('#contact-btnm');
  contactBtnM.on('click',function(){
    $('#contact-form').slideToggle(200);
    $('#mobile-menu').slideUp(100);
    $('#openbtn-top').removeClass('cross-t');
    $('#openbtn-center').show();
    $('#openbtn-bottom').removeClass('cross-b');
    $('#error').remove();
  });

  var contactBtnF = $('#contact-btn2');
  contactBtnF.on('click',function(){
    $('#contact-form').slideToggle(200);
    $('#error').remove();
  });

  $('#close-btn').on('click', function(){
    $('#contact-form').slideUp(200);
    $('#error').remove();
  });

  $('#menuopen-btn').on('click',function(e){
    var center = $('#openbtn-center');
    center.toggle();
    $('#mobile-menu').slideToggle(70);
  });

  $('#menuopen-btn').on('click',function(){
    $('#openbtn-top').toggleClass('cross-t');
    $('#openbtn-bottom').toggleClass('cross-b');
  });

  $(window).on('resize',function() {
    var wWidth = $(window).width();
    if(wWidth >= 1026 ){
      $('#mobile-menu').hide();
    }
  });

});