
/**
 * @함수이름 : bookInsertForm
 * @작성일 : 2015. 12. 8.
 * @개발자 : 성기훈
 * @설명 : 도서등록 Form 스크립트
 */
function bookDataForm(form){
	if(form.book_num.value==""){
		alert("도서번호를 써주세요.");
		form.id_check.focus();
		return false;
	}
	
	if(form.book_name.value==""){
		alert("도서번호를 써주세요.");
		form.id_check.focus();
		return false;
	}
	
	if(form.book_writer.value==""){
		alert("저자를 써주세요.");
		form.id_check.focus();
		return false;
	}
	
	if(form.book_publisher.value==""){
		alert("출판사를 써주세요.");
		form.id_check.focus();
		return false;
	}
	
	var strDate="";
	if(form.book_publish_date_year.value!="년"||form.book_publish_date_month.value!="월"||form.book_publish_date_day.value!="일"){
		if(form.book_publish_date_year.value=="년"||form.book_publish_date_month.value=="월"||form.book_publish_date_day.value=="일"){
			alert("년, 월, 일을 모두 올바르게 입력해주세요.");
			return false;
		}
		
		if(form.book_publish_date_month.value==2){
			if(form.book_publish_date_year.value%4==0&&form.book_publish_date_year.value%100!=0){
				if(form.book_publish_date_day.value>29){
					alert("출판일을 다시 확인해주세요.");
					return false;
				}
			}
			
			if(form.book_publish_date_year.value%4!=0||form.book_publish_date_year.value%100==0){
				if(form.book_publish_date_day.value>28){
					alert("출판일을 다시 확인해주세요.");
					return false;
				}
			}
		}
		
		if(form.book_publish_date_month.value==4||form.book_publish_date_month.value==6||form.book_publish_date_month.value==9||form.book_publish_date_month.value==11){
			if(form.book_publish_date_day.value>30){
				alert("출판일을 다시 확인해주세요.");
				return false;
			}
		}
		
		strDate=form.book_publish_date_year.value+"/"+form.book_publish_date_month.value+"/"+form.book_publish_date_day.value;
		//alert(strDate);
		form.book_publish_date.value=strDate;
	}
	
	if(form.book_cost.value==""){
		alert("도서원가를 써주세요.");
		form.id_check.focus();
		return false;
	}
	
	if(form.book_price.value==""){
		alert("도서가격을 써주세요.");
		form.id_check.focus();
		return false;
	}
	
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