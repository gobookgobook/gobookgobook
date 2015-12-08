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
	<h3>bookinsert</h3>
	<a href="${root}/bookManage/bookInsert.do">BookInsert</a><br/>
	<h3>bookOrderList</h3>
	<a href="${root}/bookUser/bookOrderList.do">BookOrderlist</a>
	<h3>member</h3>
	<a href="${root}/member/register.do">회원가입</a>
	
	<h3>mypage</h3>
	<%-- <c:set var="member_id" value="${'11'}" scope="session"/> --%>
	<c:set var="root" value="${pageContext.request.contextPath }"/>
	<a href="${root}/myPage/myPageOrderList.do">마이페이지</a>
	<P>  The time on the server is ${serverTime}. </P>


	<h2> test</h2>
</body>
</html>
