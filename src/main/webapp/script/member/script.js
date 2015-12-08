/**
 * 
 */

/**
 * @함수이름 : registerForm
 * @작성일 : 2015. 12. 8.
 * @개발자 : 강주혁
 * @설명 : 로그인 예외처리
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
	
	var str="";
	var count=0;
	for(var i=0;i<form.member_interestValue.length;i++){
		if(form.member_interestValue[i].checked==true){
			str += form.member_interestValue[i].value + ",";
			count++;
			if(count>3){
				alert("관심분야는 최대 3개만 입력 가능합니다.");
				return false;
			}
		}
	}
	
	form.member_interest.value=str;
	
	var strDate="";
	if(form.member_birth_year.value!="년"||form.member_birth_month.value!="월"||form.member_birth_day.value!="일"){
		if(form.member_birth_year.value=="년"||form.member_birth_month.value=="월"||form.member_birth_day.value=="일"){
			alert("년, 월, 일을 모두 올바르게 입력해주세요.");
			return false;
		}
		
		if(form.member_birth_month.value==2){
			if(form.member_birth_year.value%4==0&&form.member_birth_year.value%100!=0){
				if(form.member_birth_day.value>29){
					alert("생년월일을 다시 확인해주세요.");
					return false;
				}
			}
			
			if(form.member_birth_year.value%4!=0||form.member_birth_year.value%100==0){
				if(form.member_birth_day.value>28){
					alert("생년월일을 다시 확인해주세요.");
					return false;
				}
			}
		}
		
		if(form.member_birth_month.value==4||form.member_birth_month.value==6||form.member_birth_month.value==9||form.member_birth_month.value==11){
			if(form.member_birth_day.value>30){
				alert("생년월일을 다시 확인해주세요.");
				return false;
			}
		}
		
		strDate=form.member_birth_year.value+"/"+form.member_birth_month.value+"/"+form.member_birth_day.value;
		//alert(strDate);
		form.member_birth.value=strDate;
	}
	
	
	if(strDate==""){
		strDate="1800/01/01";
	}
	
	form.member_birth.value=strDate;
}

/**
 * @함수이름 : idCheck
 * @작성일 : 2015. 12. 8.
 * @개발자 : 강주혁
 * @설명 : 아이디 체크
 */
function idCheck(root, memberForm){	
	var id=memberForm.id_check.value;
	
	var url=root+"/member/idCheck.do?member_id="+id;
	//alert(url);
	window.open(url,"","width=250, height=150");
}

/**
 * @함수이름 : zipcodeRead
 * @작성일 : 2015. 12. 8.
 * @개발자 : 강주혁
 * @설명 : 우편번호
 */
function zipcodeRead(root){
	var url =root+"/member/zipcode.do";
	//alert(url);
	
	window.open(url,"","width=400, height=400, scrollbars=yes");
}

/**
 * @함수이름 : sendAddress
 * @작성일 : 2015. 12. 8.
 * @개발자 : 강주혁
 * @설명 : 주소를 다시 회원가입창으로 보여줌
 */
function sendAddress(zipcode,sido,gugun,dong,ri,bunji){
	var address1=sido+" "+gugun+" "+dong+" "+ri+" "+bunji;
	//alert(zipcode + "," + address1);
	
	opener.memberForm.member_zipcode.value=zipcode;
	opener.memberForm.zipcodeDisp.value=zipcode;
	opener.memberForm.member_address1.value=address1;
	opener.memberForm.address1Disp.value=address1;
	self.close();
}

/**
 * @함수이름 : chooseId
 * @작성일 : 2015. 12. 8.
 * @개발자 : 강주혁
 * @설명 : id 선택
 */
function chooseId(){
	opener.memberForm.member_id.value=opener.memberForm.id_check.value;
	opener.memberForm.id_check.disabled="disabled";
	self.close();
}

/**
 * @함수이름 : resetId
 * @작성일 : 2015. 12. 8.
 * @개발자 : 강주혁
 * @설명 : id 초기화
 */
function resetId(root){
	opener.memberForm.member_id.value="";
	opener.memberForm.id_check.value="";
	location.href=root+"/member/idCheck.do?member_id="+opener.memberForm.member_id.value;
}

/**
 * @함수이름 : cancel
 * @작성일 : 2015. 12. 8.
 * @개발자 : 강주혁
 * @설명 : id 취소
 */
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