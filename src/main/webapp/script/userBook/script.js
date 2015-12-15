/**
 * 
 */

/**
 * @함수이름 : soldOutAsk
 * @작성일 : 2015. 12. 15.
 * @개발자 : 오주석
 * @설명 : 재입고 신청
 */
function soldOutAsk(root, book_num){
	var url=root+"/userBook/userBookSoldOutAsk.do?book_num="+book_num;
	alert(url);
	
	$.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function(data){
			alert(data);
			if(data > 0){
				alert("재입고 신청되었습니다.");
			}else{
				alert("재입고 신청 실패");
			}

		},
		error:function(xhr, status, errorMsg){
			alert(status + "," + errorMsg);
		}
	});
}

/**
 * @함수이름 : myBasket
 * @작성일 : 2015. 12. 15.
 * @개발자 : 오주석
 * @설명 : 장바구니 담기
 */
function myBasket(root, book_num, book_name, book_price){
	
	var book_quantity=$("#book_quantity option:selected").val();
//	alert(book_quantity);
	var url=root+"/userBook/userBookBasketInsert.do?book_num="+book_num;
	url+="&book_name="+book_name;
	url+="&book_price="+book_price;
	url+="&book_quantity="+book_quantity;
//	alert(url);

	$.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function(data){
			alert(data);
			if(data > 0){
			   var retVal = confirm("장바구니에 선택하신 상품이 담겼습니다.\n장바구니를 확인하시겠습니까?");
			   if( retVal == true ){
			      location.href=root+"/myBasket/myBasketList.do";
			   }
			}else{
			   var retVal = confirm("이미 등록된 상품입니다.\n장바구니를 확인하시겠습니까?");
			   if( retVal == true ){
			      location.href=root+"/myBasket/myBasketList.do";
			   }
			}

		},
		error:function(xhr, status, errorMsg){
			alert(status + "," + errorMsg);
		}
	});
}

/**
 * @함수이름 : groupPurchaseAsk
 * @작성일 : 2015. 12. 15.
 * @개발자 : 오주석
 * @설명 : 
 */
function groupPurchaseAsk(root, book_num){
	
	var url=root+"/userBook/userBookGroupPurchaseAsk.do?book_num="+book_num;
	alert(url);
	
	$.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function(data){
//			alert(data);
			if(data > 0){
				alert("공동구매를 신청하셨습니다.");
			}else{
				alert("공동구매 신청 실패");
			}
		},
		error:function(xhr, status, errorMsg){
			alert(status + "," + errorMsg);
		}
	});
}

/**
 * @함수이름 : userbookstar_star
 * @작성일 : 2015. 12. 15.
 * @개발자 : 오주석
 * @설명 : 
 */
function userbookstar_star(root, book_num){
	
	var star=$('#userstar').html();
//	alert(star);
	
	var url=root+"/userBook/userBookStarInsert.do?book_num="+book_num;
	url+="&userbookstar_star="+star;
	
	if(star == ""){
		alert("하나는 선택해주세요.");
		$('div#inputstar').raty('set', { 'score': 1 });
		return false;
	}
	
	$.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function(data){
//			alert(data);
			var result=data.split(",");
			var star=result[0].trim();				
			var bunho=result[1].trim();
			
			if(bunho == 0){
				$('#displayStarRating').replaceWith("<span id='displayStarRating' style='padding-left:20px;'>"+star+"</span>");
				$('div#star').raty('set', { 'score': star });
			}else{
				alert("이미 별점을 평가 하셨습니다.");
				$('div#inputstar').raty('set', { 'score': 0 });
			}
			
			
		},
		error:function(xhr, status, errorMsg){
			alert(status + "," + errorMsg);
		}
	});
	
}