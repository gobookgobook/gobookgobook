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
<script type="text/javascript" src="${root}/script/memberManage/managerCoupon.js"></script>
<jsp:include page="../admin-top.jsp"/>
</head>
<body>
	<br/><br/>

<div id="contents" style="height:600px; background:white; border:1px solid black"><br/><br/><br/><br/>
<div class="managerCoupon">
	<jsp:include page="menu.jsp"/>
		<div class="managerCouponBody">
		쿠폰 상세내용
		<hr>
			<div class="couponReadAll">
				<div class="read_title">
					<span class="read_num">쿠폰번호</span>
					<span class="read_name">쿠폰이름</span>
					<span class="read_period">사용기간</span>
					<span class="read_discount">할인율</span>
				</div>
				<div class="read_title">
					<span class="read_num">${managerCouponDto.mcoupon_num}</span>
					<span class="read_name">${managerCouponDto.manager_coupon_name}</span>
					<span class="read_period"><fmt:formatDate value="${managerCouponDto.manager_coupon_period}" pattern="yyyy-MM-dd"/></span>
					<span class="read_discount">${managerCouponDto.manager_coupon_discount}</span>
				</div>
				<div class="read_content">
					<label class="content_title">내용</label>
					<span class="manager_coupon_content">
						${managerCouponDto.manager_coupon_content }
					</span>
				</div>
				<div style="text-align: right;">
					<input type="button" value="쿠폰 발급" onclick="location.href='${root}/memberManager/memberManageCouponGiveUser.do?mcoupon_num=${managerCouponDto.mcoupon_num}'" style="width: 100px; height:45px;" />
				</div>
			</div>
		</div>
</div>
</div>
<%-- <jsp:include page="../main-bottom.jsp"/> --%>
	<br/><br/>
</body>
</html>