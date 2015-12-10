/**
 * 
 */

/**
 * @함수이름 : registerForm
 * @작성일 : 2015. 12. 8.
 * @개발자 : 강주혁
 * @설명 : 매장관리 예외처리
 */
function locationWriteForm(form){
	if(form.location_address1.value==""){
		alert("주소검색은 반드시 해야합니다.");
		return false;
	}
	
	if(form.location_address2.value==""){
		alert("지도보기에서 상세주소를 표시해주세요.");
		return false;
	}

	var mapAddr=form.latLng.value;
	var arr=mapAddr.split(", ");
	
	var str1=arr[0].substr(1,arr[0].length-1);
	var str2=arr[1].substr(0,arr[1].length-1);
	
	form.location_lat.value=str1;
	form.location_lng.value=str2;
}

/**
 * @함수이름 : locationRead
 * @작성일 : 2015. 12. 10.
 * @개발자 : 강주혁
 * @설명 : 주소검색
 */
function locationRead(root){
	var url =root+"/location/zipcode.do";
	//alert(url);
	
	window.open(url,"","width=400, height=400, scrollbars=yes");
}

/**
 * @함수이름 : sendAddress
 * @작성일 : 2015. 12. 10.
 * @개발자 : 강주혁
 * @설명 : 주소를 다시 페이지에 반환
 */
function sendAddress(sido,gugun,dong,ri,bunji){
	var address1=sido+" "+gugun+" "+dong+" "+ri+" "+bunji;
	
	opener.locationForm.location_address1.value=address1;
	opener.locationForm.address1Disp.value=address1;
	self.close();
}