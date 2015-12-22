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
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<jsp:include page="../admin-top.jsp"/>
</head>
<body>
<div id="contents" style="height:500px; background:white; border:0px solid black">
		<div style="margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
			<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;>쿠폰 관리</b>
		</div>
		
		<div align="left" style="width: 120px;float: left;">
			<jsp:include page="menu.jsp"/>
		</div>
		<br/>
			<div align="center"><b style="font-size:18px">쿠폰 상세내용</b></div>
		<br/>
	<div style="width: 100%; border: 0px solid black; height: 100%;">
		<div class="container" style="width:750px;">
			<table class="table table-bordered" style=" width:800px; margin: 0px auto; font-size: 14px;">
				 <tbody>
			    <tr>
			    <th style="background:#dff0d8;">쿠폰 이름</th>
			     <td colspan="3">
			       ${managerCouponDto.mcoupon_num}
			     </td>
			    </tr>
			   
			    <tr>
			    <th style="background:#dff0d8;">쿠폰 사용기간</th>
			     <td colspan="3">
					<fmt:formatDate value="${managerCouponDto.manager_coupon_period}" pattern="yyyy-MM-dd"/>
			     </td>
			    </tr>
			    
			    <tr>
			    <th style="background:#dff0d8;">쿠폰 내용</th>
			     <td colspan="3">
			       <textarea rows="10" cols="80" name="manager_coupon_content" style="resize:none; background: white;" disabled="disabled">${managerCouponDto.manager_coupon_content}</textarea>
			     </td>
			    </tr>
			    
			    <tr>
			    <th style="background:#dff0d8;">쿠폰 할인율</th>
					<c:if test="${managerCouponDto.manager_coupon_discount <100}">
						<td>${coupon.manager_coupon_discount}%</td>
					</c:if>
					<c:if test="${managerCouponDto.manager_coupon_discount >=100}">
						<td>${managerCouponDto.manager_coupon_discount}원</td>
					</c:if>
			    </tr>
		</tbody>
		</table>
			<div style="text-align: right; margin-top: 10px;">
				<input type="button" value="쿠폰 발급" onclick="location.href='${root}/memberManager/memberManageCouponGiveUser.do?mcoupon_num=${managerCouponDto.mcoupon_num}'" style="width: 100px; height:45px;" />
			</div>
		</div>
	</div>
</div>
<jsp:include page="../main-bottom.jsp"/>
	<br/><br/>
</body>
</html>