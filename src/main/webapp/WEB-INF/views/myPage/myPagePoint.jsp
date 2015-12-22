<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/myPage/point.css"/>
<jsp:include page="../main-top.jsp"/>
</head>
<body>
<div id="contents" style="height:500px; background:white; border:0px solid black; position:static;">
	<div style="margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
			<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;>마이페이지</b>
	</div>
	
	<div align="left" style="width: 110px; float:left;">
		<jsp:include page="category.jsp"/>
	</div>	
	
	<div align="left" style="float: left; margin: 10px 0 0 10px;width: 880px;" >
		<div class="point_body">
			<br/>
				<div align="center"><b style="font-size:18px">포인트 함</b></div>
			<br/>
			<c:if test="${id !=null }">
			<c:if test="${member_point > 0 }">
			<div class="user_point_title" style="text-align: center; font-size: 14">				
				당신의 포인트는 <span style="color:red; font-weight: bold;">${member_point}</span> 원 입니다
			</div>
			</c:if>
			<c:if test="${member_point == 0 || member_point ==null }">
			<div class="user_point_title" style="text-align: center; font-size: 14">
				<span>현재 보유중인 포인트가 없습니다.</span>
			</div>
			</c:if>
			</c:if>
			<c:if test="${id ==null }">
				<div align="center" style="padding-bottom:25px; border-bottom:1px solid #DDDDDD">확인하세요!<br/>지금 Login을 하신 후 포인트함을 보시면 회원님의 포인트를 보실 수 있습니다.</div>
			</c:if>
		</div>
	</div>
</div>
 <jsp:include page="../main-bottom.jsp"/> 
	<br/><br/>
</body>
</html>