<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/memberManage/managerCoupon.css"/>
<script type="text/javascript" src="${root}/js/memberManage/managerCoupon.js"></script>
</head>
<body>
	<div class="managerCoupon">
	<jsp:include page="menu.jsp"/>
		<div class="managerCouponBody">
		쿠폰 리스트
		<hr>
		<div class="couponAllList">
		<div class="couponTitle">
			<span class="mcoupon_num">쿠폰번호</span>
			<span class="manager_coupon_name">쿠폰이름</span>
			<span class="manager_coupon_field">사용범위</span>
			<span class="manager_coupon_period">사용기간</span>
			<span class="manager_coupon_discount">할인율</span>
		</div>
		<c:forEach var="coupon" items="${couponDto}">
			<div class="couponList">
				<span class="mcoupon_num">${coupon.mcoupon_num}</span>
				<span class="manager_coupon_name">
				<a href="${root}/memberManager/memberManageCouponRead.do?mcoupon_num=${coupon.mcoupon_num}">${coupon.manager_coupon_name}</a>
				</span>
				<span class="manager_coupon_field">${coupon.manager_coupon_field}</span>
				<span class="manager_coupon_period">
				<fmt:formatDate value="${coupon.manager_coupon_period}" pattern="yyyy-MM-dd"/>
				</span>
				
				<c:if test="${coupon.manager_coupon_discount <100}">
				<span class="manager_coupon_discount">${coupon.manager_coupon_discount}%</span>
				</c:if>
				<c:if test="${coupon.manager_coupon_discount >=100}">
				<span class="manager_coupon_discount">${coupon.manager_coupon_discount}원</span>
				</c:if>
			</div>
		</c:forEach>
		<div>
			<input type="button" value="쿠폰제작" onsubmit=""/>
		</div>
		</div>
		</div>
	</div>
</body>
</html>