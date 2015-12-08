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
</head>
<body>
	<div align="center">
		<h3>장바구니 목록</h3>
		<c:if test="${count==0}">
			<div>
				<h3>회원님의 장바구니에 담긴 도서가 없습니다.</h3>
			</div>
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
							<th>선택</th>
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
									 &nbsp;(<fmt:formatNumber value="${point}" pattern="#"/> &nbsp;P)
								</td>
								<td>
									<input type="text" value="${myBasket.basket_quantity}" size="1"/>&nbsp;
									<input type="button" class="btn btn-info btn-xs" value="수정"/>
								</td>
								<td><fmt:formatNumber value="${myBasket.basket_total_price}" groupingUsed="true"/>원</td>
								<td>
									<input type="checkbox" checked="checked"/>
								</td>
								<td>
									<input type="button" class="btn btn-warning btn-xs" value="삭제" onclick="javascript:deleteToServer('${myBasket.basket_num}','${myBasket.basket_total_price}','${sum}','${root}')"/>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<hr width="50%"/>
			<div align="right" style="width:50%">
				<span id="sum">상품 총 금액:${sum}원</span>
				<input type="button" class="btn btn-primary" value="주문하기" onclick=""/>
			</div>
		</c:if>
	</div>
</body>
</html>