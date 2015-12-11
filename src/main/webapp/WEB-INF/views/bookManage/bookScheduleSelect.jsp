<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="${root}/css/bookManage/style.css"/>
</head>
<body>
	<jsp:include page="../member/menu.jsp"/>
	<br/><br/>
	<c:set var="id" value="admin" scope="session"/>
	<c:if test="${id=='admin'}">
	<div id="wrap">
		<div id="header">
			<h1>GoBook!GoBook!</h1>
		</div>
		
		<div id="nav">
			<a href="${root}/bookManage/bookManage.do"><b> 도서관리 </b></a><br/>
		</div>
	
		<div id="con1" align="left" style="height:300px;">
			<jsp:include page="bookManageConNav.jsp"/>
		</div>
	
		<div id="#con2" align="left">
			<h3> 신간 도서 출간 일정</h3><br/>
			<iframe src="https://calendar.google.com/calendar/embed?showTitle=0&amp;showPrint=0&amp;showTabs=0&amp;showCalendars=0&amp;showTz=0&amp;height=400&amp;wkst=1&amp;bgcolor=%23FFFFFF&amp;ctz=Asia%2FSeoul" style="border-width:0" width="800" height="400" frameborder="0" scrolling="no"></iframe>
			<!-- <iframe src="https://calendar.google.com/calendar/embed?showPrint=0&amp;height=600&amp;wkst=1&amp;bgcolor=%23FFFFFF&amp;src=frogkh82%40gmail.com&amp;color=%2329527A&amp;src=ko.south_korea%23holiday%40group.v.calendar.google.com&amp;color=%23A32929&amp;ctz=Asia%2FSeoul" style="border-width:0" width="800" height="600" frameborder="0" scrolling="no"></iframe> -->
		</div>
	</div>
	</c:if>
	<c:if test="${id!='admin'}">
		<script type="text/javascript">
			alert("관리자만 접근이 가능한 페이지 입니다");
			location.href="${root}/member/goBookMain.do"
		</script>
	</c:if>
</body>
</html>