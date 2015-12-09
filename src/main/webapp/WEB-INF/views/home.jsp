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
	<a href="${root}/bookManage/bookManage.do">도서관리</a><br/>
	<h3>bookOrderList</h3>
	<a href="${root}/userOrder/userOrderList.do">주문현황</a>
	<h3>member</h3>
	<a href="${root}/member/register.do">회원가입</a><br/>
	<a href="${root}/member/goBookMain.do">메인화면</a>
	
	<h3>mypage</h3>
	<%-- <c:set var="member_id" value="${'11'}" scope="session"/> --%>
	<c:set var="root" value="${pageContext.request.contextPath }"/>
	<a href="${root}/myPage/myPageOrderList.do">마이페이지</a>
	
	<h3>myBasket</h3>
	<a href="${root}/myBasket/myBasketList.do">장바구니목록</a>

	<h3>QnA</h3>
	<a href="${root}/help/adminHelpQnAList.do">QnA목록으로</a><br/>
	<a href="${root}/help/adminHelpQnAWrite.do">QnA등록하기</a>
	
	<h3>Location</h3>
	<a href="${root}/location/locationWrite.do">지점등록</a>

	<h2> test</h2>
</body>
</html>
