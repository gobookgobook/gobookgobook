<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/myPage/category.css"/>
</head>
<body>
		<div class="category">
		<a href="${root}/myPage/myPageOrderList.do">주문내역</a>
		<a href="">1:1문의내역</a>
		<a href="${root}/myPage/myPageCoupon.do">쿠폰함</a>
		<a href="">포인트함</a>
		<a href="">회원수정</a>
		<a href="">회원탈퇴</a>
		</div>
</body>
</html>