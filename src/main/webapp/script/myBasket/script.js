// 숫자를  입력받아 세자리씩 끊어서 쉼표를 넣어주는 함수
/**
 * @함수이름 : numberFormat
 * @작성일 : 2015. 12. 19.
 * @개발자 : 강주혁
 * @설명 : 숫자의 포맷팅을 위한 함수
 */
function numberFormat(num){
	var numString=num+"";
	var numLength=numString.length;
	var rest=numLength%3;
	if(rest==0) rest=3;
	var result=numString;
	
	for(var i=0;i<numLength/3-1;i++){
		result = interceptString(result,rest+i*4);
	}
	
	return result;
}

/**
 * @함수이름 : interceptString
 * @작성일 : 2015. 12. 19.
 * @개발자 : 강주혁
 * @설명 : 숫자 포맷팅당 ,를 찍어주는 함수
 */
function interceptString(str,num){
	return str.substring(0,num) + "," +  str.substring(num,str.length);
}

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
			//alert(data);
			$("#listAllTd").find($("#"+basket_num)).remove();
			
			var tempNum=data;
			var strNum=numberFormat(tempNum);
			
			var tempPoint=data*0.03;
			var strPoint=numberFormat(tempPoint);

			$("#sum").replaceWith("<span id='sum' style='font-size:20px; color:red; font-weight:bold'>"+strNum+"원</span>");
			$("#point_sum").replaceWith("<span id='point_sum' style='font-size:20px'>포인트 총 적립액:"+strPoint+"원</span>");
			
			if($("tbody").children().size()==0) {	
				$("<div align='center' style='padding-bottom:25px; border-bottom:1px solid #DDDDDD'>확인하세요!<br/> 현재 고객님의 장바구니에 담긴 도서가 없습니다!</div>").insertBefore("hr");
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
			$("#totalPrice"+basket_num).replaceWith("<td style='text-align:center; font-weight:bold' id='totalPrice"+basket_num+"'>"+total_price.toLocaleString()+"원</td>");
			
			var tempNum=sum;
			var strNum=numberFormat(tempNum);
			
			var tempPoint=sum*0.03;
			var strPoint=numberFormat(tempPoint);
			
			$("#sum").replaceWith("<span id='sum' style='font-size:20px; color:red; font-weight:bold'>"+strNum+"원</span>");
			$("#point_sum").replaceWith("<span id='point_sum' style='font-size:20px'>포인트 총 적립액:"+strPoint+"원</span>");
		},
		error:function(xhr, status, errorMsg){
			alert(status + "," + errorMsg);
		}
	});
}