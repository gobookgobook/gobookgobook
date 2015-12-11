/**
 * 
 */

function insertForm(couponForm){
//	alert("ok");
	
	if(couponForm.manager_coupon_name == ""){
		alert("이름을 작성하세요.");
		couponForm.manager_coupon_name.focus();
		return false;
	}
	
	if(couponForm.manager_coupon_content == ""){
		alert("내용을 입력해 주세요.");
		couponForm.manager_coupon_content.focus();
		return false;
	}
	
	if(couponForm.manager_coupon_discount > 99){
		
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
	
	
}
