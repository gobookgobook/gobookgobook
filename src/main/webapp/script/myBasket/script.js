/**
 * 
 */
var minusSum=0;

/**
 * @함수이름 : deleteToServer
 * @작성일 : 2015. 12. 8.
 * @개발자 : 황규성
 * @설명 : 장바구니 내역 제거 Ajax
 */
function deleteToServer(basket_num, basket_total_price, sum, root){
	var url=root+"/myBasket/myBasketDelete.do?basket_num="+basket_num;
	//alert(url);
	// location.href=url;
	
	$.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function(data){
			// alert(data);
			parseInt(minusSum);
			minusSum=minusSum+parseInt(basket_total_price);
			//alert(minusSum);
			$("#listAllTd").find($("#"+basket_num)).remove();

			$("#sum").replaceWith("<span id='sum'>상품 총 금액:"+(sum-minusSum)+"원</span>");
			$("#point_sum").replaceWith("<span id='point_sum'>포인트 총 적립액:"+((sum-minusSum)*0.03)+"원</span>&nbsp;&nbsp;&nbsp;");
			
			if($("tbody").children().size()==0) {	
				$("<span>상품이 없습니다.</span>").insertBefore("hr");
				$("#order").hide();
			}
		},
		error:function(xhr, status, errorMsg){
			alert(status + "," + errorMsg);
		}
	});
}

/**
 * @함수이름 : updateToServer
 * @작성일 : 2015. 12. 9.
 * @개발자 : 황규성
 * @설명 : 장바구니 수정
 */
function updateToServer(basket_num, basket_book_price, value, sum, root){
	// alert(basket_num + "," + basket_total_price + "," + sum + "," + value + "," + root);
	var url=root+"/myBasket/myBasketUpdate.do?basket_num="+basket_num+"&basket_book_price="+basket_book_price+"&value="+value;
	// alert(url);
	location.href=url;
}