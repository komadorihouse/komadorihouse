$(function(){
  var list = $('#artists-list');
  $('#artist-menu').on('click',function(){
    list.slideToggle(100);
  });
  
  $(document).on('click',function(event) {
    if(!$(event.target).closest('#artist-menu').length) {
      list.slideUp(100);
    }
  });
});