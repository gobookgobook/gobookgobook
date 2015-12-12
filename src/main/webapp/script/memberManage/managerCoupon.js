/**
 * 
 */

/**
 * @함수이름 : insertForm
 * @작성일 : 2015. 12. 11.
 * @개발자 : 오주석
 * @설명 : 
 */
function insertForm(couponForm){
//	alert("ok");
	
	if(couponForm.manager_coupon_name.value == ""){
		alert("이름을 작성하세요.");
		couponForm.manager_coupon_name.focus();
		return false;
	}
	
	if(couponForm.manager_coupon_period_value.value == ""){
		alert("사용기간을 선택해주세요.");
		couponForm.manager_coupon_content.focus();
		return false;
	}
	
	if(couponForm.manager_coupon_content.value == ""){
		alert("내용을 입력해 주세요.");
		couponForm.manager_coupon_content.focus();
		return false;
	}
	
	if(couponForm.manager_coupon_discount.value ==""){
		alert("숫자를 입력해주세요.");
		couponForm.manager_coupon_discount.focus();
		return false;
	}
	
	var str="";
	var check=false;
	var count=0;
	for(var i=0;i<couponForm.manager_coupon_field_value.length;i++){
		if(couponForm.manager_coupon_field_value[i].checked==true){
			str += couponForm.manager_coupon_field_value[i].value + ",";
			count++;
			check=true;
			if(count>3){
				alert("사용장르는 최대 3개만 입력 가능합니다.");
				return false;
			}
		}
	}
	
//	alert(str);
	
	if(check == false){
		alert("하나라도 고르세요");
		couponForm.manager_coupon_field_value[0].focus();
		return false;
	}
	
	couponForm.manager_coupon_field.value=str;
	
	var period=couponForm.manager_coupon_period_value.value;
	couponForm.manager_coupon_period.value=period;
	
	if(couponForm.discount[0].checked == true){
		if(couponForm.manager_coupon_discount.value > 100){
			alert("99이하만 입력가능합니다.");
			return false;
		}
	}else if(couponForm.discount[1].checked == true){
		if(couponForm.manager_coupon_discount.value < 100){
			alert("100이상만 입력해주세요.");
			return false;
		}
	}else{
		alert("하나를 선택해주세요.");
		return false;
	}


}


