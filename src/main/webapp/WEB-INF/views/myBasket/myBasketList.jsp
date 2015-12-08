<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<c:if test="${count==0}">
			<div>
				<h3>장바구니에 담긴 도서가 없습니다.</h3>
			</div>
		</c:if>
		
		<c:if test="${count > 0}">
			<%-- <c:set var="basket_final_price" value="0"/> --%>
			
			<table width="530" border="1">
				<tr>
					<td width="250" align="center">책제목</td>
					<td width="100"  align="center">판매가</td>
					<td width="110" align="center">수량</td>
					<td width="100"  align="center">합계</td>
				</tr>
				
				<c:forEach var="myBasket" items="${myBasketList}">	<%-- 서비스에서 넘겨준 myBasketList --%>
				<c:set var="sum" value="${sum+myBasket.basket_total_price}"/>	
					<tr>
						<td>${myBasket.basket_book_name}</td>
						<td>${myBasket.basket_book_price}</td>
						<td>
							<input type="text" value="${myBasket.basket_quantity}" size="1"/>&nbsp;
							<input type="button" value="수정"/>
						</td>
						<td>${myBasket.basket_total_price}</td>
					</tr>
				</c:forEach>
			</table>
			
			<hr/>
			
			<div align="right">
				<span>상품 총 금액:${sum}</span>
				<input type="button" value="주문하기"/>
			</div>
		</c:if>
	</div>
</body>
</html>