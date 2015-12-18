<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/myPage/coupon.css"/>
<jsp:include page="../main-top.jsp"/>
</head>
<body>
<div id="contents" style="height:750px; background:white; border:0px solid black; position:static;"><br/><br/><br/><br/>
	<div style="background-color: #6799FF;margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
			<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;마이페이지</b>
	</div>
	<div align="left" style="width: 120px; float:left;">
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
			
			<c:if test="${couponSelect.size() > 0}">	
				<c:forEach var="couponSelect" items="${couponSelect}">	
					<div class="user_coupon_title">
						<div class="user_coupon_name">${couponSelect.user_coupon_name}</div>
						<div class="user_coupon_content">${couponSelect.user_coupon_content}</div>
						<div class="user_coupon_discount">${couponSelect.user_coupon_discount}</div>
						<div class="user_coupon_field">${couponSelect.user_coupon_field}</div>
						<div class="user_coupon_period"><fmt:formatDate value="${couponSelect.user_coupon_period}" pattern="yyyy-MM-dd"/></div>
					</div>
				</c:forEach>	
			</c:if>
			<c:if test="${couponSelect.size() == 0}">
				<div class="user_coupon_title" style="text-align: center; font-size: 20">
					현재 보유중인 쿠폰이 없습니다.
				</div>
			</c:if>	
			</div>	
		</div>
	</div>
</div>
<jsp:include page="../main-bottom.jsp"/> 
	<br/><br/>	
</body>
</html>