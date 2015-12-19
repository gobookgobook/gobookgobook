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
			<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;마이페이지</b>
	</div>
	
	<div align="left" style="width: 110px; float:left;">
		<jsp:include page="category.jsp"/>
	</div>	
	
	<div align="left" style="float: left; margin: 10px 0 0 10px;width: 880px;" >
			
			<div class="point_body">
				<c:if test="${member_point > 0 }">
				<h1 style="margin-left:20px">포인트 함</h1>
					${member_point}
				</c:if>
				<c:if test="${member_point == 0 || member_point ==null }">
				<div class="user_point_title" style="text-align: center; font-size: 20">
					<span>현재 보유중인 포인트가 없습니다.</span>
					</div>
				</c:if>	
			
		</div>
	</div>
</div>
 <jsp:include page="../main-bottom.jsp"/> 
	<br/><br/>
</body>
</html>