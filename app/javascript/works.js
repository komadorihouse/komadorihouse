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

  $('#close-btn').on('click', function(){
    $('#contact-form').slideUp(200);
    $('#error').remove();
  });

  
});