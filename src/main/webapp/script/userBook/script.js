/**
 * 
 */

/**
 * @함수이름 : userBookRead
 * @작성일 : 2015. 12. 16.
 * @개발자 : 오주석
 * @설명 : 도서 상세보기
 */
function userBookRead(root, book_num){
	var url =root +"/userBook/userBookRead.do?book_num="+book_num;
//	alert(url);
	
	location.href=url;
}
/**
 * @함수이름 : soldOutAsk
 * @작성일 : 2015. 12. 15.
 * @개발자 : 오주석
 * @설명 : 재입고 신청
 */
function soldOutAsk(root, book_num){
	var url=root+"/userBook/userBookSoldOutAsk.do?book_num="+book_num;
//	alert(url);
	
	$.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function(data){
//			alert(data);
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
 * @설명 : 장바구니 넣기
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
//			alert(data);
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
 * @설명 : 공동구매 신청
 */
function groupPurchaseAsk(root, book_num){
	
	var url=root+"/userBook/userBookGroupPurchaseAsk.do?book_num="+book_num;
//	alert(url);
	
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
 * @설명 : 별점 주기
 */
function userbookstar_star(root, book_num){
	
	var star=$('#userstar').val();
//	alert(star);
	
	var url=root+"/userBook/userBookStarInsert.do?book_num="+book_num;
	url+="&userbookstar_star="+star;
//	alert(url);
	
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


/**
 * @함수이름 : startSuggest
 * @작성일 : 2015. 12. 16.
 * @개발자 : 성기훈
 * @설명 : 도서검색 suggest
 */
var rt="";
function startSuggest(root){
	rt=root;
	$(function(){
		$("#keyword").autocomplete({
			source : function( request, response ) {
			     $.ajax({
			       	    type: 'post',
			            url: rt+"/userBook/suggest.do",
			            dataType: "json",
			            data: { value : request.term },	//request.term = $("#autocomplete").val()
			            success: function(data) {
			            	//서버에서 json 데이터 response 후 목록에 뿌려주기 위함
			                response( 
			                	$.map(data, function(item) {
			               			return {
			               				label: item.data,
			               				value: item.data
			              			}
			              		})
			              	);
			            }
			       });
		        },
			//조회를 위한 최소글자수
			minLength: 1,
			select: function( event, ui ) {
				// 만약 검색리스트에서 선택하였을때 선택한 데이터에 의한 이벤트발생
			}
		});
	});
}

function groupPurchaseInsert(root, book_num, gp_num){
	var url=root+"/userBook/userBookGroupPurchaseInsert.do?book_num="+book_num;
	url+="&gp_num="+gp_num;
//	alert(url);
	
	$.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function(data){
//			alert(data);
			var result=data.split(",");
			var value=result[0].trim();				
			var count=result[1].trim();
			
			var purchase=$('#purchase_count').html();
			var purcahse_count=parseInt(purchase);
			var hap=purcahse_count+1;
			
			if(value>0){
				alert("공동구매를 신청하셧습니다.");
				$('#purchase_count').html(hap);
			}else{
				alert("이미 공동구매 신청을 하셨습니다.");
			}
			
		},
		error:function(xhr, status, errorMsg){
			alert(status + "," + errorMsg);
		}
	});
	
	
}


/**
 * @함수이름 : order
 * @작성일 : 2015. 12. 18.
 * @개발자 : 오주석
 * @설명 : 도서 즉시구매
 */
function order(root, book_num, book_price, book_name){
	var book_quantity=$("#book_quantity option:selected").val();
	var url=root+"/userOrder/userOrder.do?book_num="+book_num;
	url+="&book_quantity="+book_quantity;
	url+="&book_price="+book_price;
	url+="&book_name="+book_name;
	
//	alert(url);
	
	location.href=url;
}

function preview(root, book_preview_file_name){
	var url=root + "/userBook/userBookPreview.do?book_preview_file_name="+book_preview_file_name;
	alert(url);
	
	
}



