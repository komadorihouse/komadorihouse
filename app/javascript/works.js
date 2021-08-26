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

// showのスライド  
  var leftBtn = $('#left-btn');
  var rightBtn = $('#right-btn');
  var imgNum = 1

  //スライド数の確認
  var image1Val = $('#image1').val();
  var image2Val = $('#image2').val();
  var image3Val = $('#image3').val();
  var image4Val = $('#image4').val();
  var image5Val = $('#image5').val();
  var image6Val = $('#image6').val();
  var image7Val = $('#image7').val();
  var image8Val = $('#image8').val();
  var image9Val = $('#image9').val();
  var image10Val = $('#image10').val();
  var slidePage = 10
  if(image2Val == ''){
    var slidePage = 1
  }else if(image3Val == ''){
    var slidePage = 2
  }else if(image4Val == ''){
    var slidePage = 3
  }else if(image5Val == ''){
    var slidePage = 4
  }else if(image6Val == ''){
    var slidePage = 5
  }else if(image7Val == ''){
    var slidePage = 6
  }else if(image8Val == ''){
    var slidePage = 7
  }else if(image9Val == ''){
    var slidePage = 8
  }else if(image10Val == ''){
    var slidePage = 9
  }
  console.log(slidePage)

  rightBtn.on('click',function(){
    if(imgNum == slidePage){
      imgNum = 1
      $(`#img-${slidePage}`).hide();
    }else{
      imgNum += 1
    }
    console.log(imgNum)
    $(`#img-${imgNum-1}`).hide();
    $(`#img-${imgNum}`).show();
  });

  leftBtn.on('click',function(){
    if(imgNum == 1){
      imgNum = slidePage
      $('#img-1').hide();
    }else{
      imgNum -= 1
    }
    $(`#img-${imgNum+1}`).hide();
    $(`#img-${imgNum}`).show();
    console.log(imgNum)
  });


});