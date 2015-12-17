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
	<br/><br/>
<div id="contents" style="background:white; border:1px solid black; position: static;"><br/><br/><br/><br/>	

    
    <c:if test="${id==null}">
		<h3 align="center">회원가입 혹은 로그인을 해주세여</h3>
		<div align="center">
			<a href="${root}/member/register.do">회원가입</a> <a href="${root}/member/login.do">로그인</a>
		</div>
	</c:if>
    <c:if test="${id !=null}">
		<div align="center">
			<h3>장바구니 목록</h3>
			<c:if test="${count==0}">
				<div class="container" style="width:50%">
					<table class="table table-bordered">
						<thead>
							<tr class="info" align="center" style="color:#1770b5">
								<th>책제목</th>
								<th>판매가</th>
								<th>수량</th>
								<th>합계</th>
	<!-- 							<th>선택</th> -->
								<th>삭제</th>
							</tr>
						</thead>
						<tbody id="listAllTd"></tbody>
					</table>
				</div>
				<span>상품이 없습니다.</span>
				<hr width="50%" color="blue"/>
			</c:if>
			
			<c:if test="${count > 0}">
				
				<div class="container" style="width:50%">
					<table class="table table-bordered">
						<thead>
							<tr class="info" align="center" style="color:#1770b5">
								<th>책제목</th>
								<th>판매가</th>
								<th>수량</th>
								<th>합계</th>
	<!-- 							<th>선택</th> -->
								<th>삭제</th>
							</tr>
						</thead>
						<tbody id="listAllTd">
						<c:set var="sum" value="0"/>
							<c:forEach var="myBasket_total" items="${myBasketList}">
								<c:set var="sum" value="${sum+myBasket_total.basket_total_price}"/>
							</c:forEach>
							
							<c:forEach var="myBasket" items="${myBasketList}">
							<c:set var="point" value="${myBasket.basket_book_price*0.03}"/>	
								<tr class="info" id="${myBasket.basket_num}">
									<td>${myBasket.basket_book_name}</td>
									<td>
										<fmt:formatNumber value="${myBasket.basket_book_price}" groupingUsed="true"/>원
										 &nbsp;(<fmt:formatNumber value="${point}" groupingUsed="true" pattern="#"/> &nbsp;P)
									</td>
									<td>
										<form name="quantity_update" method="post">
											<input type="text" id="upQuantity${myBasket.basket_num}" name="upQuantity" value="${myBasket.basket_quantity}" size="1" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'/>&nbsp;
											<c:set var="value" value="upQuantity.value"/>
											<input type="button" class="btn btn-info btn-xs" value="수정" onclick="updateToServer('${myBasket.basket_num}', ${value}, '${root}')"/>
										</form>
									</td>
									<td id="totalPrice${myBasket.basket_num}"><fmt:formatNumber value="${myBasket.basket_total_price}" groupingUsed="true"/>원</td>
									<!-- <td>
										<input type="checkbox" checked="checked"/>
									</td> -->
									<td>
										<input type="button" id="delete" class="btn btn-warning btn-xs" value="삭제" onclick="javascript:deleteToServer('${myBasket.basket_num}','${myBasket.member_id}','${root}')"/>
									</td>
								</tr>
							</c:forEach>
							
							<c:set var="point_sum" value="${sum*0.03}"/>
						</tbody>
					</table>
				</div>
				
				<hr width="50%" color="blue"/>
				<div align="right" id="order" style="width:50%">
					<span id="point_sum">포인트 총 적립액:<fmt:formatNumber value="${point_sum}" groupingUsed="true"/>원</span>&nbsp;&nbsp;&nbsp;
					<span id="sum">상품 총 금액:<fmt:formatNumber value="${sum}" groupingUsed="true"/>원</span>
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