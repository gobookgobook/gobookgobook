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
<jsp:include page="../main-top.jsp"/>
</head>
<body>
<div id="contents" style="height:750px; background:white; border:1px solid black"><br/><br/><br/><br/>
	<div class="all">
		<jsp:include page="category.jsp"/>
		<c:if test="${id !=null}">
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
		</c:if>
		<c:if test=${id ==null }>
			로그인후 이용가능합니다.
		</c:if>
	</div>
</div>
<%-- <jsp:include page="../main-bottom.jsp"/> --%>
	<br/><br/>	
</body>
</html>