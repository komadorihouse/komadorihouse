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

// headerのメニューanimetion
  const nomalRogo = $('#nomal');
  //works
  $('#works-btn').on('mouseover',function(){
    nomalRogo.hide();
    $('#works').show();
  });
  $('#works-btn').on('mouseout',function(){
    $('#works').hide();
    nomalRogo.show();
  });
  //profile
  $('#profile-btn').on('mouseover',function(){
    nomalRogo.hide();
    $('#profile').show();
  });
  $('#profile-btn').on('mouseout',function(){
    $('#profile').hide();
    nomalRogo.show();
  });
  //contact
  $('#contact-btn').on('mouseover',function(){
    nomalRogo.hide();
    $('#contact').show();
  });
  $('#contact-btn').on('mouseout',function(){
    $('#contact').hide();
    nomalRogo.show();
  });
  //link
  $('#link-btn').on('mouseover',function(){
    nomalRogo.hide();
    $('#link').show();
  });
  $('#link-btn').on('mouseout',function(){
    $('#link').hide();
    nomalRogo.show();
  });
  //news
  $('#rogo-kana').on('mouseover',function(){
    var wWidth = $(window).width();
    if(wWidth >= 1026 ){
      nomalRogo.hide();
      $('#news').show();
    }
  });
  $('#rogo-kana').on('mouseout',function(){
    var wWidth = $(window).width();
    if(wWidth >= 1026 ){
      $('#news').hide();
      nomalRogo.show();
    }
  });
  $('#news-btn').on('mouseover',function(){
    var wWidth = $(window).width();
    if(wWidth >= 1026 ){
      nomalRogo.hide();
      $('#news').show();
    }
  });
  $('#news-btn').on('mouseout',function(){
    var wWidth = $(window).width();
    if(wWidth >= 1026 ){
      $('#news').hide();
      nomalRogo.show();
    }
  });
  //nomalrogo表示
  $('.image-area-rogo').on('mouseover',function(){
    var wWidth = $(window).width();
    if(wWidth >= 1026 ){
      nomalRogo.hide();
      $('#nomalrogo').show();
    }
  });
  $('.image-area-rogo').on('mouseout',function(){
    var wWidth = $(window).width();
    if(wWidth >= 1026 ){
      $('#nomalrogo').hide();
      nomalRogo.show();
    }
  });

// showのスライド機能 
  var leftBtn = $('#left-btn');
  var rightBtn = $('#right-btn');
  var imgNum = 1

  //スライド数の確認
  var imgPage = $('.work-image').length;
  var slidePage = imgPage

  rightBtn.on('click',function(){
    if(imgNum == slidePage){
      imgNum = 1
      $(`#img-${slidePage}`).fadeOut(700);
    }else{
      imgNum += 1
      $(`#img-${imgNum-1}`).fadeOut(700);
    }
    $(`#img-${imgNum}`).delay(700).fadeIn(700);
    console.log(imgNum);
    console.log(slidePage);
  });

  leftBtn.on('click',function(){
    if(imgNum == 1){
      imgNum = slidePage
      $('#img-1').fadeOut(700);
    }else{
      imgNum -= 1
      $(`#img-${imgNum+1}`).fadeOut(700);
    }
    $(`#img-${imgNum}`).delay(700).fadeIn(700);
    console.log(imgNum);
    console.log(slidePage);
  });

  // pege top btn
  var pageTop = $('#page_top');
  var appear = false;
  
  $(window).scroll(function(){
    if($(this).scrollTop() > 400 ){
        pageTop.show();
        console.log($(this).scrollTop());
    }else{
        pageTop.hide();
    }
  pageTop.delay(3000).fadeOut(600);
  

  });
  pageTop.on('click',function () {
    $('body,html').animate({
        scrollTop: 0
    }, 1000);
  });



});