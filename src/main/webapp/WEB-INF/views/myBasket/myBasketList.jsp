<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${root}/script/jquery.js"></script>
<script type="text/javascript" src="${root}/script/myBasket/script.js"></script>
<script type="text/javascript">
	// 수정 수량에 숫자만 입력하게 하기
	function onlyNumber(event){
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			return false;
	}
	
	function removeChar(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
	}
</script>
<jsp:include page="../main-top.jsp"/>
</head>
<body>
<div id="contents" style="background:white; border:0px solid black; position:static;">
    <c:if test="${id==null}">
    	<div style="margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
			<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;> 장바구니 목록</b>
		</div>
		<br/><br/>
		
		<div class="container" style="width:999px;padding:0px">
			<table class="table table-bordered">
				<thead>
					<tr style="color:white;background-color:#37415a">
						<th style="text-align:center">책제목</th>
						<th style="text-align:center">판매가</th>
						<th style="text-align:center">수량</th>
						<th style="text-align:center">합계</th>
						<th style="text-align:center">삭제</th>
					</tr>
				</thead>
				<tbody id="listAllTd"></tbody>
			</table>
		</div>
		<div align="center" style="padding-bottom:25px; border-bottom:1px solid #DDDDDD">확인하세요!<br/>현재 고객님의 장바구니에 담긴 도서가 없습니다!<br/>지금 Login을 하신 후 장바구니를 보시면 회원님의 장바구니를 보실 수 있습니다.</div>
		
	</c:if>
	
    <c:if test="${id !=null}">
    	<div style="margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
			<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;> 장바구니 목록</b>
		</div>
		
		<div align="center">
			<br/><br/>
			<c:if test="${count==0}">
				<div class="container" style="width:999px;padding:0px">
					<table class="table table-bordered">
						<thead>
							<tr style="color:white;background-color:#37415a">
								<th style="text-align:center">책제목</th>
								<th style="text-align:center">판매가</th>
								<th style="text-align:center">수량</th>
								<th style="text-align:center">합계</th>
								<th style="text-align:center">삭제</th>
							</tr>
						</thead>
						<tbody id="listAllTd"></tbody>
					</table>
				</div>
				<div align="center" style="padding-bottom:25px; border-bottom:1px solid #DDDDDD">확인하세요!<br/> 현재 고객님의 장바구니에 담긴 도서가 없습니다!</div>
			</c:if>
			
			<c:if test="${count > 0}">
				
				<div class="container" style="width:999px;padding:0px">
					<table class="table table-bordered">
						<thead>
							<tr style="color:white;background-color:#37415a">
								<th style="text-align:center">책제목</th>
								<th style="text-align:center">판매가</th>
								<th style="text-align:center">수량</th>
								<th style="text-align:center">합계</th>
								<th style="text-align:center">삭제</th>
							</tr>
						</thead>
						<tbody id="listAllTd">
						<c:set var="sum" value="0"/>
							<c:forEach var="myBasket_total" items="${myBasketList}">
								<c:set var="sum" value="${sum+myBasket_total.basket_total_price}"/>
							</c:forEach>
							
							<c:forEach var="myBasket" items="${myBasketList}">
							<c:set var="point" value="${myBasket.basket_book_price*0.03}"/>	
								<tr id="${myBasket.basket_num}">
									<td>${myBasket.basket_book_name}</td>
									<td style="text-align:center">
										<b><fmt:formatNumber value="${myBasket.basket_book_price}" groupingUsed="true"/>원</b>
										 &nbsp;(<fmt:formatNumber value="${point}" groupingUsed="true"/> &nbsp;P)
									</td>
									<td style="text-align:center">
										<form name="quantity_update" method="post">
											<input type="text" id="upQuantity${myBasket.basket_num}" name="upQuantity" value="${myBasket.basket_quantity}" size="2" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'/>&nbsp;
											<c:set var="value" value="upQuantity.value"/>
											<input type="button" class="btn btn-info btn-xs" value="수정" onclick="updateToServer('${myBasket.basket_num}', ${value}, '${root}')"/>
										</form>
									</td>
									<td style="text-align:center;font-weight: bold" id="totalPrice${myBasket.basket_num}"><fmt:formatNumber value="${myBasket.basket_total_price}" groupingUsed="true"/>원</td>
									<!-- <td>
										<input type="checkbox" checked="checked"/>
									</td> -->
									<td style="text-align:center">
										<input type="button" id="delete" class="btn btn-warning btn-xs" value="삭제" onclick="javascript:deleteToServer('${myBasket.basket_num}','${myBasket.member_id}','${root}')"/>
									</td>
								</tr>
							</c:forEach>
							
							<c:set var="point_sum" value="${sum*0.03}"/>
						</tbody>
					</table>
				</div>
				
				<hr width="100%" color="blue"/>
				<div align="right" id="order" style="width:999px;padding:0px">
					<span id="point_sum" style="font-size: 20px">포인트 총 적립액:<fmt:formatNumber value="${point_sum}" groupingUsed="true"/>원</span>&nbsp;&nbsp;&nbsp;
					<span style="font-size:20px">상품 총 금액:</span>
					<span id="sum" style="font-size: 20px; color:red; font-weight:bold"><fmt:formatNumber value="${sum}" groupingUsed="true"/>원</span>
					<input type="button" class="btn btn-primary" value="주문하기" onclick="javascript:location.href='${root}/userOrder/userOrderList.do'"/>
				</div>
			</c:if>
		</div>
	</c:if>
</div>
<jsp:include page="../main-bottom.jsp"/>
	<br/><br/>		
</body>
</html>