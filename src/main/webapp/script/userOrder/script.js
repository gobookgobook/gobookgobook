/**
 * 
 */
/**
 * @함수이름 : win_op
 * @작성일 : 2015. 12. 17.
 * @개발자 : 황규성
 * @설명 : 새 창 가운데 위치
 */
function win_op(mypage, myname, w, h, scroll) {
	var winl = (screen.width - w) / 2;
	var wint = (screen.height - h) / 2;
	winprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scroll+',resizable'
	win = window.open(mypage, myname, winprops)
	
	if (parseInt(navigator.appVersion) >= 4) { 
		win.window.focus(); 
	}
}

/**
 * @함수이름 : zipcodeRead
 * @작성일 : 2015. 12. 17.
 * @개발자 : 황규성
 * @설명 : 우편번호 리스트
 */
function zipcodeRead(root){
	var url =root+"/member/zipcode.do";
	//alert(url);
	
	win_op(url,"","400", "400", "yes");
}

/**
 * @함수이름 : couponRead
 * @작성일 : 2015. 12. 17.
 * @개발자 : 황규성
 * @설명 : 쿠폰 리스트
 */
function couponRead(root){
	var url=root+"/userOrder/userOrderCouponList.do";
	//alert(url);
	
	win_op(url,"","200", "200", "yes");
}

/**
 * @함수이름 : sendCoupon
 * @작성일 : 2015. 12. 17.
 * @개발자 : 황규성
 * @설명 : 쿠폰을 주문 창에 뿌려줌 
 */
function sendCoupon(user_coupon_num, user_coupon_name, user_coupon_discount){
	// alert(user_coupon_name + " " + user_coupon_discount);
	opener.memberForm.order_user_coupon_num.value=user_coupon_num;
	opener.memberForm.order_user_coupon_name.value=user_coupon_name;
	opener.memberForm.couponNameDisp.value=user_coupon_name;
	if(user_coupon_discount<100){
		opener.memberForm.couponDiscountDisp.value=user_coupon_discount+"%";
	}else{
		opener.memberForm.couponDiscountDisp.value=user_coupon_discount+"원";
	}
	opener.memberForm.coupon_discount.value=user_coupon_discount;
	self.close();
}

function applyPoint(root, point, memberPoint,order_book_point){
	//alert(root + "," + point.value+","+memberPoint);
	if(point.value%100!=0){
		alert("100원단위 미만은 사용하실 수 없습니다.");
		return false;
	}
	
	if(point.value>memberPoint.value){
		alert("보유하신 Point 보다 적용하실 Point가 클 수 없습니다.");
		point.value=0;
	}else{
		alert("포인트가 적용되었습니다.");
		memberPoint.value=memberPoint.value-point.value;
		
		var odp=parseInt(order_book_point.value);
		if(order_book_point.value==(null)||order_book_point.value==("")){
			odp=0;
		}else{
			odp=parseInt(order_book_point.value);
		}
		order_book_point.value=odp+parseInt(point.value);
		
		var dispPoint=document.getElementById("applyPointDisp");
		dispPoint.innerHTML="적용된 포인트 : "+order_book_point.value+" Point";
		point.value=0;
	}
}

/*function payToServer(root, order_bunho){
	
	var url=root + "/userOrder/userOrderList.do?order_bunho="+order_bunho;
	//alert(url);
	$.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function(data){
			$("#c").click(function(){
				$("#bank").hide();	
				$("#phone").hide();
				$("#card").show();
			});
			
			$("#b").click(function(){
				$("#card").hide();
				$("#phone").hide();
				$("#bank").show();
			});
			
			$("#p").click(function(){
				$("#card").hide();
				$("#bank").hide();
				$("#phone").show();
			});
		},
		error:function(xhr,status,errorMsg){
			alert(status + "," + errorMsg);
		}
	
	});
}*/