/**
 * 
 */

/**
 * @함수이름 : soldOutAsk
 * @작성일 : 2015. 12. 15.
 * @개발자 : 오주석
 * @설명 : 
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
 * @설명 : 
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
	alert(star);
	
	var url=root+"/userBook/userBookStarInsert.do?book_num="+book_num;
	url+="&userbookstar_star="+star;
	alert(url);
	
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
 * @함수이름 : startSuggest 이하 hide 까지
 * @작성일 : 2015. 12. 15.
 * @개발자 : 성기훈
 * @설명 : 도서검색 suggest
 */

var checkFirst = false;
var lastKeyword = '';
var loopSendKeyword = false;
var rt="";
function startSuggest(root){
	rt=root;
	if (checkFirst == false) {
		setTimeout("sendKeyword();", 500); //0.5초 후에 sendKeyword() 호출
		loopSendKeyword = true;
	}
	checkFirst = true;
}

function sendKeyword() {
	if (loopSendKeyword == false) return;
		  
	var keyword = document.getElementById("keyword").value;
	if (keyword == '') {
		lastKeyword = '';
		hide('suggest');
	} else if (keyword != lastKeyword) {
		lastKeyword = keyword;
		   
		if (keyword != '') {
			var params = "keyword="+encodeURIComponent(keyword);
			$(function(){
				$.ajax({
					url:rt+"/userBook/suggest.do",
					type:"post",
					data:params,
					contentType:"application/x-www-form-urlencoded;charset=utf-8",
					dataType:"text",
					success:displayResult
				});			
			})
		} else {
			hide('suggest');
		}
	}
	setTimeout("sendKeyword();", 500);
}

function displayResult() {
	if (xhr.readyState == 4) {					//4 : 데이터를 전부 받은 상태
		if (xhr.status == 200) {				//200 : 서버로 부터의 요청이 성공하면
			var resultText = xhr.responseText;	//응답 text값을 가져온다.
			var result = resultText.split('|');
			var count = parseInt(result[0]);
			var keywordList = null;
			if (count > 0) {
				keywordList = result[1].split(',');
				var html = '';
				for (var i = 0 ; i < keywordList.length ; i++) {
					html += "<a href=\"javascript:select('"+keywordList[i]+"')\">"+keywordList[i]+"</a><br/>";
				}
				var listView = document.getElementById('suggestList');
				listView.innerHTML = html;
			     
				show('suggest');
			} else {
				hide('suggest');
			}
		} else {
			alert("에러 발생: "+xhr.status);
		}
	}
}

function select(selectedKeyword) {
	document.getElementById("keyword").value = selectedKeyword;
	loopSendKeyword = false;
	checkFirst = false;
	hide('suggest');
}

function show(elementId) {
	var element = document.getElementById(elementId);
	if (element) {
		element.style.display = '';
	}
}

function hide(elementId) {
	var element = document.getElementById(elementId);
	if (element) {
		element.style.display = 'none';
	}
}
