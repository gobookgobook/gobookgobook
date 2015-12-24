
/**
 * @함수이름 : bookDataForm
 * @작성일 : 2015. 12. 8.
 * @개발자 : 성기훈
 * @설명 : 도서등록 스크립트
 */
function bookDataForm(form){
	if(form.book_num.value==""){
		alert("도서번호를 써주세요.");
		form.book_num.focus();
		return false;
	}
	
	if(form.book_name.value==""){
		alert("도서번호를 써주세요.");
		form.book_name.focus();
		return false;
	}
	
	if(form.book_writer.value==""){
		alert("저자를 써주세요.");
		form.book_writer.focus();
		return false;
	}
	
	if(form.book_publisher.value==""){
		alert("출판사를 써주세요.");
		form.book_publisher.focus();
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
		form.book_cost.focus();
		return false;
	}
	
	if(form.book_price.value==""){
		alert("도서가격을 써주세요.");
		form.book_price.focus();
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
 * @작성일 : 2015. 12. 23.
 * @개발자 : 성기훈
 * @설명 : 도서 수정 스크립트
 */
function bookUpdateForm(upform){
	// alert("OK");
	if(upform.book_name.value==""){
		alert("도서번호를 써주세요.");
		upform.book_name.focus();
		return false;
	}
	
	if(upform.book_writer.value==""){
		alert("저자를 써주세요.");
		upform.book_writer.focus();
		return false;
	}
	
	if(upform.book_publisher.value==""){
		alert("출판사를 써주세요.");
		upform.book_publisher.focus();
		return false;
	}
	
	var strDate="";
	if(upform.book_publish_date_year.value!="년"||upform.book_publish_date_month.value!="월"||upform.book_publish_date_day.value!="일"){
		if(upform.book_publish_date_year.value=="년"||upform.book_publish_date_month.value=="월"||upform.book_publish_date_day.value=="일"){
			alert("년, 월, 일을 모두 올바르게 입력해주세요.");
			return false;
		}
		
		if(upform.book_publish_date_month.value==2){
			if(upform.book_publish_date_year.value%4==0&&upform.book_publish_date_year.value%100!=0){
				if(upform.book_publish_date_day.value>29){
					alert("출판일을 다시 확인해주세요.");
					return false;
				}
			}
			
			if(upform.book_publish_date_year.value%4!=0||upform.book_publish_date_year.value%100==0){
				if(upform.book_publish_date_day.value>28){
					alert("출판일을 다시 확인해주세요.");
					return false;
				}
			}
		}
		
		if(upform.book_publish_date_month.value==4||upform.book_publish_date_month.value==6||upform.book_publish_date_month.value==9||upform.book_publish_date_month.value==11){
			if(upform.book_publish_date_day.value>30){
				alert("출판일을 다시 확인해주세요.");
				return false;
			}
		}
		
		strDate=upform.book_publish_date_year.value+"/"+upform.book_publish_date_month.value+"/"+upform.book_publish_date_day.value;
		//alert(strDate);
		upform.book_publish_date.value=strDate;
		
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
		form.group_purchase_price.focus();
		return false;
	}
	
	if(form.group_purchase_min_count.value==""){
		alert("공구 시작 수량을 써주세요.");
		form.group_purchase_min_count.focus();
		return false;
	}
	
	if(form.group_purchase_max_count.value==""){
		alert("공구 마감 수량을 써주세요.");
		form.group_purchase_max_count.focus();
		return false;
	}
	
	if(form.group_purchase_date_year.value=="년"||form.group_purchase_date_month.value=="월"||form.group_purchase_date_day.value=="일"){
		alert("년, 월, 일을 모두 올바르게 입력해주세요.");
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

/**
 * @함수이름 : bookSpecialPriceCancleFun
 * @작성일 : 2015. 12. 23.
 * @개발자 : 성기훈
 * @설명 : 특가 설정 취소 스크립트
 */
function bookSpecialPriceCancleFun(root,book_num,pageNumber){
	var check=confirm("특별 할인을 종료 하시겠습니까?");
	if(check==true) {
		location.href=root+"/bookManage/bookSpecialPriceCancle.do?book_num="+book_num+"&pageNumber="+pageNumber;
	}
	return check;
}

/**
 * @함수이름 : gpSuccessConfirm
 * @작성일 : 2015. 12. 23.
 * @개발자 : 성기훈
 * @설명 : 공동구매 조건달성 진행 스크립트
 */
function gpSuccessConfirm(root,book_num,gp_num,group_purchase_price){
	// alert(root +" "+ book_num+" "+ gp_num+" "+ group_purchase_price);
	location.href=root+"/bookManage/gpSuccessConfirm.do?book_num="+book_num+"&gp_num="+gp_num+"&group_purchase_price="+group_purchase_price;
}

/**
 * @함수이름 : bookStockUpdateFun
 * @작성일 : 2015. 12. 24.
 * @개발자 : 성기훈
 * @설명 : 입고변경 스크립트
 */
function bookStockUpdateFun(bsuform){
	if(bsuform.reorder_quantity.value==""){
		alert("입고수량을 입력하세요.");
		bsuform.reorder_quantity.focus();
		return false;
	}
	
	if(bsuform.reorder_quantity.value<0){
		alert("음수는 입력할수 없습니다.");
		bsuform.reorder_quantity.focus();
		return false;
	}
}

function returnPage(root,pageInfo,pageNumber){
	//alert("ok");
	if(pageInfo=="bookSchedule") location.href=root+"/bookManage/bookSchedule.do";
	else if (pageInfo=="bookROCL") location.href=root+"/bookManage/bookReOrderCountList.do?pageNumber="+pageNumber;
	else if (pageInfo=="bookSOL") location.href=root+"/bookManage/bookSoldOutList.do?pageNumber="+pageNumber;
	else if (pageInfo=="bookSL") location.href=root+"/bookManage/bookStockList.do?pageNumber="+pageNumber;
	else if (pageInfo=="bookSP") location.href=root+"/bookManage/bookSpecialPrice.do?pageNumber="+pageNumber;
	else location.href=root+"/bookManage/bookList.do?pageNumber=1";
}