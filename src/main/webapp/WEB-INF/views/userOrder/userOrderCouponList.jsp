<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${root}/css/userOrder/style.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="${root}/script/userOrder/script.js"></script>
<link rel="Shortcut Icon" href="${root}/images/favicon.ico"/>
</head>
<body>
	<div align="center">
		<table>
			<c:choose>
				<c:when test="${userOrderCouponList==null || userOrderCouponList.size()==0}">
					<tr>
						<td>등록된 쿠폰이 없습니다.</td>
					</tr>
				</c:when>
				
				<c:when test="${userOrderCouponList.size() >0 }">
					<tr>
						<td>쿠폰을 선택해 주세요.</td>
					</tr>
					<c:forEach var="couponList" items="${userOrderCouponList}">
						<tr>
							<td>
								<a id="couponA" href="javascript:sendCoupon('${couponList.user_coupon_num}', '${couponList.user_coupon_name}','${couponList.user_coupon_discount}')">
									${couponList.user_coupon_name}
									${couponList.user_coupon_discount}
								</a>
							</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
	</div>
	
	<br/>
	<div align="center">
		<a id="closeA" href="javascript:close()">닫기</a>
	</div>
</body>
</html>