/**
 * 
 */

function registerForm(form){
	//alert("ok");
	if(form.id_check.value==""){
		alert("아이디를 써주세요.");
		form.id_check.focus();
		return false;
	}
	
	if(form.member_password.value==""){
		alert("패스워드는 반드시 입력해야 합니다.");
		form.member_password.focus();
		return false;
	}
	
	if(form.member_password.value.length<6){
		alert("패스워드는 6글자 이상입니다.");
		form.member_password.focus();
		return false;
	}
	
	if(form.member_password.value != form.passwordCheck.value){
		alert("패스워드가 일치하지 않습니다.");
		form.passwordCheck.focus();
		return false;
	}
	
	if(form.member_name.value == ""){
		alert("이름은 반드시 입력해야 합니다.");
		form.member_name.focus();
		return false;
	}
	
	if(form.member_zipcode.value=="" || form.member_address1.value==""){
		alert("우편번호 검색으로 주소를 선택해야 합니다.");
		form.zipcodeBtn.focus();
		return false;
	}
	
	if(form.member_address2.value==""){
		alert("상세주소를 입력해야 합니다.");
		form.member_address2.focus();
		return false;
	}
	
	if(form.member_phone.value==""){
		alert("전화번호를 입력해야 합니다.");
		form.member_phone.focus();
		return false;
	}
	
	if(form.member_id.value==""){
		alert("아이디 중복체크를 반드시 해주세요.");
		form.id_check.focus();
		return false;
	}
	
	if(form.birth.value==""){
		form.member_birth.value="1800/01/01";
	}else{
		form.member_birth.value=form.birth.value;
	}
}

function idCheck(root, memberForm){	
	var id=memberForm.id_check.value;
	
	var url=root+"/member/idCheck.do?member_id="+id;
	//alert(url);
	window.open(url,"","width=250, height=150");
}

function zipcodeRead(root){
	var url =root+"/member/zipcode.do";
	//alert(url);
	
	window.open(url,"","width=400, height=400, scrollbars=yes");
}

function sendAddress(zipcode,sido,gugun,dong,ri,bunji){
	var address1=sido+" "+gugun+" "+dong+" "+ri+" "+bunji;
	//alert(zipcode + "," + address1);
	
	opener.memberForm.member_zipcode.value=zipcode;
	opener.memberForm.zipcodeDisp.value=zipcode;
	opener.memberForm.member_address1.value=address1;
	opener.memberForm.address1Disp.value=address1;
	self.close();
}

function chooseId(){
	opener.memberForm.member_id.value=opener.memberForm.id_check.value;
	opener.memberForm.id_check.disabled="disabled";
	self.close();
}

function resetId(root){
	opener.memberForm.member_id.value="";
	opener.memberForm.id_check.value="";
	location.href=root+"/member/idCheck.do?id="+opener.memberForm.member_id.value;
}

function cancel(){
	opener.memberForm.member_id.value="";
	opener.memberForm.id_check.value="";
	self.close();
}

function readFun(boardNumber,currentPage,root){
	var url = root+"/photoBoard/read.do?boardNumber="+boardNumber+"&pageNumber="+currentPage;
	//alert(url);
	location.href=url;
}

function idClick(form){
	if(form.value=="아이디"){
		form.value="";
	}
}

function passClick(form){
	if(form.value=="비밀번호"){
		form.type="password";
		form.value="";
	}
}