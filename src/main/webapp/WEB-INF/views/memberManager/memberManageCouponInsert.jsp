<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/memberManage/managerCoupon.css"/>
<script type="text/javascript" src="${root}/script/memberManage/managerCoupon.js"></script>
<script type="text/javascript" src="${root}/script/event/start/jquery.js"></script>
<script type="text/javascript" src="${root}/script/event/start/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/script/event/start/jquery-ui.css"/>
<script type="text/javascript" src="${root}/script/memberManage/managerCoupon.js"></script>
<script type="text/javascript">
$(function(){
	$('#date').datepicker({
		dateFormat:"yy/mm/dd",
	    changeMonth: true,
	    monthNamesShort: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
	   	changeYear: true,
		monthNames: ["1월", "2월", "3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
 		showOn:"button",
		buttonImage:"${root}/css/memberManage/calendar.gif", 
		buttonImageOnly:true

	});
	
	$('#percent').click(function(){
		alert("0~99까지만 입력가능합니다.");
	});
	
	$('#won').click(function(){
		alert("100이상 입력가능합니다.");
	});

});

</script>
<jsp:include page="../admin-top.jsp"/>
</head>
<body>
	<br/><br/>
<div id="contents" style="height:600px; background:white; border:1px solid black"><br/><br/><br/><br/>
	<div class="managerCoupon">
		<jsp:include page="menu.jsp"/>
		<div class="managerCouponBody">
		쿠폰 제작
		<hr>
			<form  action="${root}/memberManager/memberManageCouponInsertOk.do" class="couponInsert" name="couponForm" onsubmit="return insertForm(this)" method="post">
				<div>
					<label class="coupon_title">쿠폰이름</label>
					<span class="coupon_content">
						<input type="text" name="manager_coupon_name">
					</span>
				</div>
				<div>
					<label class="coupon_title">쿠폰 사용기간</label>
					<span class="coupon_content">
						<input type="text" id="date" name="manager_coupon_period_value" disabled="disabled"/>
						<input type="hidden" name="manager_coupon_period">
						<%-- <input type="button" id="date" onsubmit="javascript:period('${root}')"/> --%>
					</span>
				</div>
				<div>
					<label class="coupon_title">쿠폰 내용</label>
					<span class="coupon_content">
						<input type="text" name="manager_coupon_content"/>
					</span>
				</div>
				<div>
					<label class="coupon_title">쿠폰 할인율</label>
					<div>
						<span class="coupon_content">
							<input type="radio" name="discount" id="percent"/>%
							<input type="radio" name="discount" id="won"/>원
						</span>
						<span>
							<input type="text" name="manager_coupon_discount" id="coupon"/> (원/%)
						</span>
					</div>
				</div>
				<div>
					<span>
						<input type="submit" value="쿠폰 등록"/>
					</span>
				</div>
			</form>
		</div>
	</div>
</div>
<%-- <jsp:include page="../main-bottom.jsp"/>
	<br/><br/> --%>
</body>
</html>