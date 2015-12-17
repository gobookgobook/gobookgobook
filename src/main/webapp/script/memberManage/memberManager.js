/**
 * 
 */

/**
 * @함수이름 : zipcodeManagerRead
 * @작성일 : 2015. 12. 17.
 * @개발자 : 오주석
 * @설명 : 우편번호 
 */
function zipcodeManagerRead(root){

	var url=root+"/memberManage/managerZipcode.do";
//	alert(url);
	
	window.open(url, "", "width=400px, height=400px, scrollbars=yes");
}

/**
 * @함수이름 : sendAddress
 * @작성일 : 2015. 12. 17.
 * @개발자 : 오주석
 * @설명 : 우편번호
 */
function sendAddress(zipcode, sido, gugun, dong, ri, bunji){
	
	var address=sido + " " + gugun + " " + dong + " " + ri + " " + bunji;
//	alert(address);
	
	opener.managerForm.manager_zipcode.value=zipcode;
	opener.managerForm.manager_zipcode_view.value=zipcode;
	opener.managerForm.manager_address1_view.value=address;
	opener.managerForm.manager_address1.value=address;
	self.close();
	
}