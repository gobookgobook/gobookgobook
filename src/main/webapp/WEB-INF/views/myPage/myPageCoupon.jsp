<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/myPage/coupon.css"/>
</head>
<body>
	<div>
		<div class="title">
		※마이페이지${couponSelect.size()}
		</div>
		<jsp:include page="category.jsp"/>
		<div class="body">
			<div class="myPageCouponSelect">
				<div class="user_coupon_title">
					<div class="user_coupon_name">쿠폰명</div>
					<div class="user_coupon_content">내용</div>
					<div class="user_coupon_discount">할인율</div>
					<div class="user_coupon_field">사용범위</div>
					<div class="user_coupon_period">유효기간</div>
				</div>
				
			<c:forEach var="couponSelect" items="${couponSelect}">	
				<div class="user_coupon_title">
					<div class="user_coupon_name">${couponSelect.user_coupon_name}</div>
					<div class="user_coupon_content">${couponSelect.user_coupon_content}</div>
					<div class="user_coupon_discount">${couponSelect.user_coupon_discount}</div>
					<div class="user_coupon_field">${couponSelect.user_coupon_field}</div>
					<div class="user_coupon_period"><fmt:formatDate value="${couponSelect.user_coupon_period}" pattern="yyyy-MM-dd"/></div>
				</div>
			</c:forEach>	
			</div>	
		</div>
	</div>
</body>
</html>