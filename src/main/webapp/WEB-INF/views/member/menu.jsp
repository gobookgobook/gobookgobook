<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${id==null}">
		<a href="${root}/member/register.do">회원가입</a>
		<a href="${root}/member/login.do">로그인</a>
		<a href="${root}/myPage/myPageOrderList.do">myPage</a>
		<a href="${root}/myBasket/myBasketList.do">장바구니</a>
	</c:if>
	
	<c:if test="${id!=null}">
		<a href="${root}/member/update.do">회원수정</a>
		<a href="${root}/member/delete.do">회원탈퇴</a>
		<a href="${root}/member/logout.do">로그아웃</a>
		<a href="${root}/myPage/myPageOrderList.do">myPage</a>
		<a href="${root}/myBasket/myBasketList.do">장바구니</a>
		
		<c:if test="${id == 'admin'}">
			<a href="${root}/bookManage/bookManage.do">관리자</a>
		</c:if>
	</c:if>
</body>
</html>