<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>GoBookGoBook</title>
<link rel="stylesheet" type="text/css" href="${root}/css/memberManage/managerCoupon.css"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${root}/script/memberManage/managerCoupon.js"></script>
<jsp:include page="../admin-top.jsp"/>
</head>
<body>
<div id="contents" style="height:600px; background:white; border:0px solid black">
	<c:if test="${id=='admin'}">
		<div style="margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
			<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;>쿠폰 관리</b>
		</div>
		
		<div align="left" style="width: 120px;float: left;">
			<jsp:include page="menu.jsp"/>
		</div>
		
		<br/>
			<div align="center"><b style="font-size:18px">쿠폰 목록</b></div>
		<br/>
	<div style="width: 100%; border: 0px solid black; height: 100%; margin-left: 50px;">
		<div class="container" style="width:800px;">
			<table class="table table-bordered" style="line-height: 100px">
				<thead>
					<tr class="success" align="center" style="color:#1DDB16">
						<th style="text-align:center">쿠폰번호</th>
						<th style="text-align:center">쿠폰이름</th>
						<th style="text-align:center">사용기간</th>
						<th style="text-align:center">할인율</th>
					</tr>
				</thead>
				<tbody id="listAllTd">
				<c:if test="${couponDto.size() > 0}">
					<c:forEach var="coupon" items="${couponDto}">
						<tr class="success">
							<td style="text-align:center">${coupon.mcoupon_num}</td>
							<td style="text-align:left">
								<a href="${root}/memberManager/memberManageCouponRead.do?mcoupon_num=${coupon.mcoupon_num}">${coupon.manager_coupon_name}</a>
							</td>
							<td style="text-align:center"><fmt:formatDate value="${coupon.manager_coupon_period}" pattern="yyyy-MM-dd"/></td>
							<c:if test="${coupon.manager_coupon_discount <100}">
								<td style="text-align:center">${coupon.manager_coupon_discount}%</td>
							</c:if>
							<c:if test="${coupon.manager_coupon_discount >=100}">
								<td style="text-align:center">${coupon.manager_coupon_discount}원</td>
							</c:if>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${couponDto.size()==0}">
					<div align="center">등록된 쿠폰이 없습니다.</div>
				</c:if>
				</tbody>
			</table>
			<div align="right">
				<input style="width: 70px; height: 30px;" type="button" value="쿠폰제작" onclick="location.href='${root}/memberManager/memberManageCouponInsert.do'"/>
			</div>
		</div>
	</div>
	</c:if>
</div>
<jsp:include page="../main-bottom.jsp"/>
</body>
</html>