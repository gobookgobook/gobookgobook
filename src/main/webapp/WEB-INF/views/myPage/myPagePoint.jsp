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
</head>
<body>
	<div>
		<div class="title">
		※마이페이지
		</div>
		<jsp:include page="category.jsp"/>
		<div class="body">
		포인트 함
		<hr>
			<div class="point_title">
				현재 보유중인 포인트
			</div>
			<div class="point_body">
				${member_point}	
			</div>
		</div>
	</div>
</body>
</html>