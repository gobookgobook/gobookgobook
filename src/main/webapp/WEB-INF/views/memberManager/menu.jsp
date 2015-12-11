<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/myPage/category.css"/>
</head>
<body>
		<jsp:include page="../member/menu.jsp"/>
   		<br/><br/>
		<div class="title">
		※관리자정보 및 쿠폰 관리
		</div>
		<div class="category">
		<a href="${root}/memberManager/memberManageCouponList.do">쿠폰 목록</a>
		<a href="${root}/memberManager/memberManageCouponInsert.do">쿠폰 생성</a>
		<a href="${root}/memberManager/memberManagerUpdate.do">관리자 정보 수정</a>
		<a href="${root }">메인</a>
		</div>
</body>
</html>
</body>
</html>