/**
 * 
 */

function registerForm(form){
	//alert("ok");
	if(form.id_check.value==""){
		alert("아이디를 써주세요..");
		form.id_check.focus();
		return false;
	}
	
	if(form.password.value==""){
		alert("패스워드는 반드시 입력해야 합니다.");
		form.password.focus();
		return false;
	}
	
	if(form.password.value.length<6){
		alert("패스워드는 6글자 이상입니다.");
		form.password.focus();
		return false;
	}
	
	if(form.password.value != form.passwordCheck.value){
		alert("패스워드가 일치하지 않습니다.");
		form.passwordCheck.focus();
		return false;
	}
	
	if(form.name.value == ""){
		alert("이름은 반드시 입력해야 합니다.");
		form.name.focus();
		return false;
	}
	
	if(form.id.value==""){
		alert("아이디 중복체크를 반드시 해주세요.");
		form.id_check.focus();
		return false;
	}
}

function idCheck(root, memberForm){	
	var id=memberForm.id_check.value;
	
	var url=root+"/member/idCheck.do?id="+id;
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
	
	opener.memberForm.zipcode.value=zipcode;
	opener.memberForm.address1.value=address1;
	self.close();
}

function chooseId(){
	opener.memberForm.id.value=opener.memberForm.id_check.value;
	opener.memberForm.id_check.disabled="disabled";
	self.close();
}

function resetId(root){
	opener.memberForm.id.value="";
	opener.memberForm.id_check.value="";
	location.href=root+"/member/idCheck.do?id="+opener.memberForm.id.value;
}

function cancel(){
	opener.memberForm.id.value="";
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