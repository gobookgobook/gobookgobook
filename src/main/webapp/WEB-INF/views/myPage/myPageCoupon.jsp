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
<jsp:include page="../main-top.jsp"/>
</head>
<body>
<div id="contents" style="height:350px; background:white; border:0px solid black; position:static;">
	<div style="margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
			<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;마이페이지</b>
	</div>
	
	<div align="left" style="width: 110px; float:left;">
		<jsp:include page="category.jsp"/>
	</div>	
	
	<div align="left" style="float: left;margin: 10 0 0 10px; width: 880px;">
			<!-- <h3>쿠폰함</h3> -->		
				
				<div class="container" style="width:100%">
					<table class="table table-bordered">
						<thead>
							<tr class="info" align="center" style="color:#1770b5">
								<th>쿠폰명</th>					
								<th>쿠폰내용</th>
								<th>쿠폰할인율</th>
								<th>쿠폰적용기간</th>
							</tr>
						</thead>
			<c:if test="${couponSelect.size() > 0}">
						<tbody>
						  <tr>
						  <td>가입쿠폰</td>
						  <td>가입축하</td>
						  <td>500</td>
						   <td>2015-12-29</td>
						</tbody>
			</c:if>
					</table>
				</div>
			<c:if test="${couponSelect.size() == 0}">
			<div class="user_coupon_title" style="text-align: center; font-size: 20">
					<span>현재 보유중인 쿠폰이 없습니다.</span>
					</div>
			</c:if>	
	</div>
</div>
<jsp:include page="../main-bottom.jsp"/> 
	<br/><br/>	
</body>
</html>