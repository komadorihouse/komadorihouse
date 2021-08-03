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

});