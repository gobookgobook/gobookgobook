<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<meta charset="UTF-8">
	<title>Home</title>
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	<h3>bookManage</h3>
	<a href="${root}/bookManage/bookInsert.do">도서등록</a><br/>
	<a href="${root}/bookManage/bookStockList.do">도서현황</a><br/>
	<h3>bookOrderList</h3>
	<a href="${root}/bookUser/bookOrderList.do">주문현황</a>
	<h3>member</h3>
	<a href="${root}/member/register.do">회원가입</a>
	
	<h3>mypage</h3>
	<%-- <c:set var="member_id" value="${'11'}" scope="session"/> --%>
	<c:set var="root" value="${pageContext.request.contextPath }"/>
	<a href="${root}/myPage/myPageOrderList.do">마이페이지</a>
	
	<h3>myBasket</h3>
	<a href="${root}/myBasket/myBasketList.do">장바구니목록</a>
	<P>  The time on the server is ${serverTime}. </P>


	<h2> test</h2>
</body>
</html>
