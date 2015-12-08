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
			
		},
		error:function(xhr, status, errorMsg){
			alert(status + "," + errorMsg);
		}
	});
}