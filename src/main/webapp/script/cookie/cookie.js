/**
 * 
 */

  var defaultTop=parseInt($("#quick").css("top"));
  $(window).on("scroll",function(){
     var scv=$(window).scrollTop();

     $("#quick").stop().animate({top:scv+defaultTop+"px"},1000);
  });