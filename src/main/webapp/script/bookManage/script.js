
/**
 * @함수이름 : bookDataForm
 * @작성일 : 2015. 12. 8.
 * @개발자 : 성기훈
 * @설명 : 도서등록 및 수정 스크립트
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
 * @함수이름 : groupPurchaseDeleteFun
 * @작성일 : 2015. 12. 21.
 * @개발자 : 성기훈
 * @설명 : 공구등록 취소 스크립트
 */
function groupPurchaseDeleteFun(root,gp_num){
	var check=confirm("공동구매 진행을 취소하시겠습니까?");
	if(check==true) {
		location.href=root+"/bookManage/bookGroupPurchaseDelete.do?gp_num="+gp_num;
	}
	return check;
}

/**
 * @함수이름 : groupPurchaseForm
 * @작성일 : 2015. 12. 21.
 * @개발자 : 성기훈
 * @설명 : 공동구매 등록 및 수정 스크립트
 */
function groupPurchaseForm(form){
	if(form.group_purchase_price.value==""){
		alert("공구가격을 써주세요.");
		form.id_check.focus();
		return false;
	}
	
	if(form.group_purchase_min_count.value==""){
		alert("공구 시작 수량을 써주세요.");
		form.id_check.focus();
		return false;
	}
	
	if(form.group_purchase_max_count.value==""){
		alert("공구 마감 수량을 써주세요.");
		form.id_check.focus();
		return false;
	}
	
	var strDate="";
	if(form.group_purchase_date_year.value!="년"||form.group_purchase_date_month.value!="월"||form.group_purchase_date_day.value!="일"){
		if(form.group_purchase_date_year.value=="년"||form.group_purchase_date_month.value=="월"||form.group_purchase_date_day.value=="일"){
			alert("년, 월, 일을 모두 올바르게 입력해주세요.");
			return false;
		}
		
		if(form.group_purchase_date_month.value==2){
			if(form.group_purchase_date_year.value%4==0&&form.group_purchase_date_year.value%100!=0){
				if(form.group_purchase_date_day.value>29){
					alert("공구 마감일을 다시 확인해주세요.");
					return false;
				}
			}
			
			if(form.group_purchase_date_year.value%4!=0||form.group_purchase_date_year.value%100==0){
				if(form.group_purchase_date_day.value>28){
					alert("공구마감일을 다시 확인해주세요.");
					return false;
				}
			}
		}
		
		if(form.group_purchase_date_month.value==4||form.group_purchase_date_month.value==6||form.group_purchase_date_month.value==9||form.group_purchase_date_month.value==11){
			if(form.group_purchase_date_day.value>30){
				alert("공구마감일을 다시 확인해주세요.");
				return false;
			}
		}
		
		strDate=form.group_purchase_date_year.value+"/"+form.group_purchase_date_month.value+"/"+form.group_purchase_date_day.value;
		//alert(strDate);
		form.group_purchase_date.value=strDate;
	}
}