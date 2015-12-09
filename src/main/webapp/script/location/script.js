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
	alert("매장관리");
}

function locationRead(root){
	var url =root+"/location/zipcode.do";
	//alert(url);
	
	window.open(url,"","width=400, height=400, scrollbars=yes");
}