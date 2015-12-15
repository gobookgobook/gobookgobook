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
	if(form.location_address.value==""){
		alert("주소는 반드시 입력 해야합니다.");
		return false;
	}
}
