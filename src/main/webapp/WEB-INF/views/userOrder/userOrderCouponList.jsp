<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>GoBookGoBook</title>
<link rel="Shortcut Icon" href="${root}/images/favicon.ico"/>
<link href="${root}/css/userOrder/style.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="${root}/script/userOrder/script.js"></script>
</head>
<body style="margin: -3px; overflow-x:hidden;">
	<table style="width: 340; height: 240; border: 0; cellpadding: 0; cellspacing: 0;">
		<tbody>
			<tr>
				<td height="40"><img src="${root}/images/member/couponApplyTitle.jpg" width="340" height="40"></td>
			</tr>
			<tr>
				<td align="center">
					<table style="width: 300; height: 80; border: 0; cellpadding: 0; cellspacing: 0;">
						<tbody>
							<tr>
								<td align="center">
									<img src="${root}/images/member/couponText.gif" width="277" height="20">
								</td>
							</tr>
							<tr>
								<td height="62" width="300" background="${root}/images/member/coupon_id.jpg">
									<table style="">
										<tbody>
											
											<tr>
												<td width="99">&nbsp;</td>
												
												<td>
													<span style="font-size: 12px;">적용하실 쿠폰을 선택해주세요.</span>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table> <br>
					<table style="">
						<tbody>
							<tr>
							<td align="center">
								<table>
									<c:choose>
										<c:when test="${userOrderCouponList==null || userOrderCouponList.size()==0}">
											<tr>
												<td><span style="font-size: 12px;">등록된 쿠폰이 없습니다.</span></td>
											</tr>
										</c:when>
										
										<c:when test="${userOrderCouponList.size() >0 }">
											<tr>
												<td width="150px;">
													<b id="couponA" style="font-size: 12px;">
														쿠폰명
													</b>
												</td>
												
												<td width="80px;" style="font-size: 12px;">
													<b id="couponA" style="color: red;">
														쿠폰 할인율
													</b>
												</td>
											</tr>
											<c:forEach var="couponList" items="${userOrderCouponList}">
												<tr>
													<td width="150px;" style="font-size: 12px;">
														<span id="couponA">
															${couponList.user_coupon_name}
														</span>
													</td>
													
													<td width="80px;" style="font-size: 12px;">
														<span id="couponA" style="color: red;">
															${couponList.user_coupon_discount}
														</span>
														<c:if test="${couponList.user_coupon_discount>=100}">
															<span style="color: red;"> 원</span>
														</c:if>
														
														<c:if test="${couponList.user_coupon_discount<100}">
															<span style="color: red;"> %</span>
														</c:if>
													</td>
													<td>
														<img src="${root}/images/member/couponApplyBtn.gif" width="41"	height="18" border="0" onclick="javascript:sendCoupon('${couponList.user_coupon_num}', '${couponList.user_coupon_name}','${couponList.user_coupon_discount}')" style="cursor: pointer;">
													</td>
												</tr>
											</c:forEach>
										</c:when>
									</c:choose>
								</table>
							</td>
						</tbody>
					</table></td>
			</tr>
			<tr>
				<td height="26" align="center" valign="top" background="${root}/images/member/pop_bottom.jpg">&nbsp;</td>
			</tr>
			<tr>
				<td height="24" align="right"  background="${root}/images/member/pop_bottom2.jpg" class="close">
					<img src="${root}/images/member/close2.gif" style="cursor: pointer;" hspace="5" border="0" onclick="javascript:self.close();">
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>