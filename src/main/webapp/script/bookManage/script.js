
/**
 * @함수이름 : bookInsertForm
 * @작성일 : 2015. 12. 8.
 * @개발자 : 성기훈
 * @설명 : 도서등록 Form 스크립트
 */
function bookInsertForm(form){
	var check=false;
	var str="";
	for(var i=0;i<form.category.length;i++){
		if(form.category[i].checked==true){
			str+=form.category[i].value + ",";
			check=true;
		}
	}
	if(check==false){
		alert("카테고리를 하나 이상 선택하세요.");
		form.category[0].focus();
		return false;
	}
	
	form.book_category.value=str;
}

/**
 * @함수이름 : bookUpdateForm
 * @작성일 : 2015. 12. 8.
 * @개발자 : 성기훈
 * @설명 : 도서수정 Form 스크립트
 */
function bookUpdateForm(upform){
	var check=false;
	var str="";
	for(var i=0;i<upform.category.length;i++){
		if(upform.category[i].checked==true){
			str+=upform.category[i].value + ",";
			check=true;
		}
	}
	if(check==false){
		alert("카테고리를 하나 이상 선택하세요.");
		upform.category[0].focus();
		return false;
	}
	
	upform.book_category.value=str;
}

function groupPurchaseDeleteFun(root,gp_num){
	var check=confirm("공동구매 진행을 취소하시겠습니까?");
	if(check==true) {
		location.href=root+"/bookManage/bookGroupPurchaseDelete.do?gp_num="+gp_num;
	}
	return check;
}