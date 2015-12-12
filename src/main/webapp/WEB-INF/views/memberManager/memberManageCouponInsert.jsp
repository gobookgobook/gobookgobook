<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/memberManage/managerCoupon.css"/>
<script type="text/javascript" src="${root}/js/memberManage/managerCoupon.js"></script>
<%-- <link rel="stylesheet" type="text/css" href="${root}/css/jquery-ui.css"/>
<script type="text/javascript" src="${root}/js/jquery-ui.js"></script>
<script type="text/javascript" src="${root}/js/jquery.js"></script> --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript" src="${root}/script/memberManage/managerCoupon.js"></script>
<script type="text/javascript">
$(function(){
	$('#date').datepicker({
		dateFormat:"yy/mm/dd",
	    changeMonth: true,
	   	changeYear: true,
		monthNames: ["1월", "2월", "3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
 		showOn:"button",
		buttonImage:"${root}/js/img/calendar.gif", 
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
</head>
<body>
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
					<label class="coupon_title">쿠폰사용장르</label>
					<span class="coupon_content">
						<input type="checkbox" name="manager_coupon_field_value" value="문학"/>문학
						<input type="checkbox" name="manager_coupon_field_value" value="교육도서"/>교육도서
						<input type="checkbox" name="manager_coupon_field_value" value="전공도서"/>전공도서
						<input type="checkbox" name="manager_coupon_field_value" value="만화"/>만화
						<input type="checkbox" name="manager_coupon_field_value" value="잡지"/>잡지
						<input type="checkbox" name="manager_coupon_field_value" value="역사"/>역사
						<input type="checkbox" name="manager_coupon_field_value" value="SF/판타지"/>SF/판타지
						<input type="checkbox" name="manager_coupon_field_value" value="교양"/>교양
						<input type="hidden" name="manager_coupon_field"/>
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
</body>
</html>