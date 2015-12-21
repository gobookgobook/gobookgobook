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

	
	var couponCharge=opener.document.getElementById("applyCouponCharge");
	var totalCharge=opener.document.getElementById("applyTotalCharge");
	
	if(user_coupon_discount<100){
		opener.memberForm.couponDiscountDisp.value=user_coupon_discount+"%";
		
		couponCharge.innerHTML=user_coupon_discount+"% 할인";
		
		opener.memberForm.total.value=opener.memberForm.total.value-(opener.memberForm.total.value*user_coupon_discount*0.01);
		var tempNum=opener.memberForm.total.value;
		var strNum=numberFormat(tempNum);
		totalCharge.innerHTML=strNum+" 원";
	}else{
		opener.memberForm.couponDiscountDisp.value=user_coupon_discount+"원";
		
		couponCharge.innerHTML=user_coupon_discount+"원 할인";
		
		opener.memberForm.total.value=opener.memberForm.total.value-user_coupon_discount;
		var tempNum=opener.memberForm.total.value;
		var strNum=numberFormat(tempNum);
		totalCharge.innerHTML=strNum+" 원";
	}
	opener.memberForm.coupon_discount.value=user_coupon_discount;
	var coupon_halin = opener.document.getElementById("coupon_halin");
	var coupon_btn = opener.document.getElementById("coupon_btn");
	coupon_halin.removeChild(coupon_btn);
	
	self.close();
}

/**
 * @함수이름 : applyPoint
 * @작성일 : 2015. 12. 19.
 * @개발자 : 강주혁
 * @설명 : 총가격에서 사용자가 적용할 포인트를 빼주며, 보유한 포인트에서 사용하는 포인트만큼 빼주는 함수
 */
function applyPoint(root, point, memberPoint,order_book_point){
	//alert(root + "," + point.value+","+memberPoint);
	if(point.value<0){
		alert("음수는 입력할수 없습니다.");
		point.focus();
		return false;
	}
	
	//아이디 유효성 검사 (영문자, 숫자만 허용)
	for(var i=0;i<point.value.length ;i++ ){
		ch=point.value.charAt(i);
		if (!(ch>='0' && ch<='9')){
			alert ("사용할 포인트는 숫자로 입력해야합니다.");
			point.focus();
			return false;
		}
	}
		
	if(point.value%100!=0){
		alert("100원단위 미만은 사용하실 수 없습니다.");
		return false;
	}
	
	if(point.value>memberPoint.value){
		alert("보유하신 Point 보다 적용하실 Point가 클 수 없습니다.");
		point.value=0;
		return false;
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
		
		var pointCharge=document.getElementById("applyPointCharge");
		pointCharge.innerHTML=order_book_point.value+" Point 사용";
		
		memberForm.total.value=memberForm.total.value-point.value;
		
		var tempNum=memberForm.total.value;
		var strNum=numberFormat(tempNum);
		var totalCharge=document.getElementById("applyTotalCharge");
		totalCharge.innerHTML=strNum+" 원";
		
		point.value=0;
	}
}

// 숫자를  입력받아 세자리씩 끊어서 쉼표를 넣어주는 함수
/**
 * @함수이름 : numberFormat
 * @작성일 : 2015. 12. 19.
 * @개발자 : 강주혁
 * @설명 : 숫자의 포맷팅을 위한 함수
 */
function numberFormat(num){
	var numString=num+"";
	var numLength=numString.length;
	var rest=numLength%3;
	if(rest==0) rest=3;
	var result=numString;
	
	for(var i=0;i<numLength/3-1;i++){
		result = interceptString(result,rest+i*4);
	}
	
	return result;
}

/**
 * @함수이름 : interceptString
 * @작성일 : 2015. 12. 19.
 * @개발자 : 강주혁
 * @설명 : 숫자 포맷팅당 ,를 찍어주는 함수
 */
function interceptString(str,num){
	return str.substring(0,num) + "," +  str.substring(num,str.length);
}

/**
 * @함수이름 : userOrderForm
 * @작성일 : 2015. 12. 19.
 * @개발자 : 강주혁
 * @설명 : 새로운주소, 오래된주소 
 */
function userOrderForm(form){
	var test=false;
	
	for(var i=0; i<form.address.length;i++){
		if(form.address[i].checked==true){
			if(i==0){
				//alert("Old");
				if(form.old_address2.value==""){
					alert("주문시 주소입력을 반드시 해주세요.");
					return false;
				}
				
				if(form.old_phone.value==""){
					alert("주문시 전화번호을 입력해주세요.");
					return false;
				}
				form.order_book_user_address2.value=form.old_address2.value;
				form.order_book_user_number.value=form.old_phone.value;
				
			}else{
				//alert("new");
				if(form.member_zipcode.value==""){
					alert("새로운 주소로 주문시 주소입력을 반드시 해주세요.");
					return false;
				}
				
				if(form.member_address1.value==""){
					alert("새로운 주소로 주문시 주소입력을 반드시 해주세요.");
					return false;
				}
				
				if(form.member_address2.value==""){
					alert("새로운 주소로 주문시 주소입력을 반드시 해주세요.");
					return false;
				}
				
				if(form.member_phone.value==""){
					alert("새로운 주소로 주문시 전화번호을 새로 입력해주세요.");
					return false;
				}
				
				form.order_zipcode.value=form.member_zipcode.value;
				form.order_book_user_address1.value=form.member_address1.value;
				form.order_book_user_address2.value=form.member_address2.value;
				form.order_book_user_number.value=form.member_phone.value;
			}
		}
	}
	
}
