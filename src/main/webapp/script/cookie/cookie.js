/**
 * 
 */
/*
  var defaultTop=parseInt($("#quick").css("top"));
  $(window).on("scroll",function(){
     var scv=$(window).scrollTop();

     $("#quick").stop().animate({top:scv+defaultTop+"px"},1000);
  });
  */

  $(window).scroll(function()  
    {  
        $('#quick').animate({top:$(window).scrollTop()+100+"px" },{queue: false, duration: 350});    
    });  
    //when the close button at right corner of the message box is clicked   
    $('#quick').click(function()  
    {  
        //the messagebox gets scrool down with top property and gets hidden with zero opacity   
        $('#quick').animate({ top:"+=15px",opacity:0 }, "slow");  
    });  
    