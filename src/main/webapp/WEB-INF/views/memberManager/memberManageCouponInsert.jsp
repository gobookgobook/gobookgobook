<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<jsp:include page="../admin-top.jsp"/>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${root}/script/sales/jquery.js"></script>
<script type="text/javascript" src="${root}/script/sales/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/script/sales/jquery-ui.css"/>
<script type="text/javascript" src="${root}/script/memberManage/managerCoupon.js"></script>
<style>
.ui-datepicker{ font-size: 10px; width: 270px; }
.ui-datepicker select.ui-datepicker-month{ width:40%; font-size: 11px;}
.ui-datepicker select.ui-datepicker-year{ width:40%; font-size: 11px; }
</style>
<script type="text/javascript">
$(function(){
	$('#date').datepicker({
		dateFormat:"yy/mm/dd",
	    changeMonth: true,
	    monthNamesShort: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
	   	changeYear: true,
		monthNames: ["1월", "2월", "3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		dayNamesMin: ["일","월","화","수","목","금","토"],
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
</head>
<body>
<div id="contents" style="height:400px; background:white; border:0px solid black; position: static;">
	
		<c:if test="${id=='admin'}">
		<div style="margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
			<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;>쿠폰 관리</b>
		</div>
		
		<div align="left" style="width: 120px;float: left;">
			<jsp:include page="menu.jsp"/>
		</div>
		
		<br/>
			<div align="center"><b style="font-size:18px">쿠폰 생성</b></div>
		<br/>
		<form  action="${root}/memberManager/memberManageCouponInsertOk.do" class="couponInsert" name="couponForm" onsubmit="return insertForm(this)" method="post">
			<input type="hidden" name="member_id" value="${memberDto.member_id}">
			
			<table class="table table-bordered" style=" width:600px; margin: 0px auto;">
				 <tbody>
			    <tr>
			    <th style="background:#dff0d8; color:#1DDB16;">쿠폰 이름</th>
			     <td colspan="3">
			       <input type="text" name="manager_coupon_name">
			     </td>
			    </tr>
			   
			    <tr>
			    <th style="background:#dff0d8; color:#1DDB16;">쿠폰 사용기간</th>
			     <td colspan="3">
					<input type="text" id="date" name="manager_coupon_period_value" disabled="disabled"/>
					<input type="hidden" name="manager_coupon_period">
			     </td>
			    </tr>
			    
			    <tr>
			    <th style="background:#dff0d8; color:#1DDB16;">쿠폰 내용</th>
			     <td colspan="3">
			       <input type="text" name="manager_coupon_content"/>
			     </td>
			    </tr>
			    
			    <tr>
			    <th style="background:#dff0d8; color:#1DDB16;">쿠폰 할인율</th>
			     <td colspan="3">
					<input type="radio" name="discount" id="percent"/>%
					<input type="radio" name="discount" id="won"/>원
					<input type="text" name="manager_coupon_discount" id="coupon"/> (원/%)
			     </td>
			    </tr>
			    
			     <tr>
			     <td colspan="4" align="center">
					<input type="submit" value="쿠폰 등록" style="width: 60px; height: 30px;"/>
			     </td>
			    </tr>
		</tbody>
		</table>
	</form>	
	</c:if>
</div>
<jsp:include page="../main-bottom.jsp"/>
</body>
</html>