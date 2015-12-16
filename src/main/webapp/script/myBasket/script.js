
/**
 * @함수이름 : deleteToServer
 * @작성일 : 2015. 12. 8.
 * @개발자 : 황규성
 * @설명 : 장바구니 내역 제거 Ajax
 */
function deleteToServer(basket_num, member_id, root){
	var url=root+"/myBasket/myBasketDelete.do?basket_num="+basket_num + "&member_id="+member_id;
	//alert(url);
	// location.href=url;
	
	$.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function(data){
			// alert(data);
			$("#listAllTd").find($("#"+basket_num)).remove();

			$("#sum").replaceWith("<span id='sum'>상품 총 금액:"+data+"원</span>");
			$("#point_sum").replaceWith("<span id='point_sum'>포인트 총 적립액:"+(data*0.03)+"원</span>");
			
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
function updateToServer(basket_num, value, root){
	// alert(basket_num + "," + basket_total_price + "," + sum + "," + value + "," + basket_previous_quantity + "," + root);
	if(value==0){
		alert("수량에 0을 입력하실 수 없습니다.");
		return false;
	}
	var url=root+"/myBasket/myBasketUpdate.do?basket_num="+basket_num+"&value="+value;
	
	// alert(url);
	// location.href=url;
	
	$.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function(data){
			// alert(data);
			var result=data.split(",");
			var basket_num=result[0].trim();
			var basket_quantity=result[1].trim();
			var basket_total_price=result[2].trim();
			var sum=result[3].trim();
			var total_price=parseInt(basket_total_price);	// 세 자리 콤마를 위한 int형변환
			// alert(total_price.toLocaleString());
			// alert(basket_num + "|" + basket_quantity + "|" + basket_total_price + "|" + sum);
			$("#totalPrice"+basket_num).replaceWith("<td id='totalPrice"+basket_num+"'>"+total_price.toLocaleString()+"원</td>");
			
			$("#sum").replaceWith("<span id='sum'>상품 총 금액:"+sum+"원</span>");
			$("#point_sum").replaceWith("<span id='point_sum'>포인트 총 적립액:"+(sum*0.03)+"원</span>");
		},
		error:function(xhr, status, errorMsg){
			alert(status + "," + errorMsg);
		}
	});
}