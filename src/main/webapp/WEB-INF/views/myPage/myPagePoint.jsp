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
<div id="contents" style="height:500px; background:white; border:0px solid black; position:static;"><br/><br/><br/><br/>
	<div style="background-color: #6799FF;margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
			<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;마이페이지</b>
	</div>
	<div align="left" style="width: 120px; float:left;">
		<jsp:include page="category.jsp"/>
		<div class="body">
		<h2>포인트 함</h2>
		<hr>
			<div class="point_body">
				<c:if test="${member_point > 0 }">
					${member_point}
				</c:if>
				<c:if test="${member_point == 0 || member_point ==null }">
					<h3>현재 보유중인 포인트가 없습니다.</h3>
				</c:if>	
			</div>
		</div>
	</div>
</div>
 <jsp:include page="../main-bottom.jsp"/> 
	<br/><br/>
</body>
</html>