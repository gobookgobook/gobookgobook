/**
 * 
 */

function zipcodeManagerRead(root){

	var url=root+"/memberManage/managerZipcode.do";
//	alert(url);
	
	window.open(url, "", "width=400px, height=400px, scrollbars=yes");
}

function sendAddress(zipcode, sido, gugun, dong, ri, bunji){
	
	var address=sido + " " + gugun + " " + dong + " " + ri + " " + bunji;
//	alert(address);
	
	opener.managerForm.manager_zipcode.value=zipcode;
	opener.managerForm.manager_zipcode_view.value=zipcode;
	opener.managerForm.manager_address1_view.value=address;
	opener.managerForm.manager_address1.value=address;
	self.close();
	
}