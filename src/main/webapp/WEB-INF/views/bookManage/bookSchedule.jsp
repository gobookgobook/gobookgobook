<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/bookManage/style.css"/>
<link rel="stylesheet" type="text/css" href="${root}/css/bookManage/fullcalendar.css" />
<script type="text/javascript" src="${root}/script/bookManage/jquery-1.5.2.min.js"></script>
<script type="text/javascript" src="${root}/script/bookManage/jquery-ui-1.8.11.custom.min.js"></script>
<script type="text/javascript" src="${root}/script/bookManage/fullcalendar.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		var arrList=${bsList};
		
		$('#calendar').fullCalendar({
			header: {
				left: '',
				center: 'title',
				right: 'prev, next today'
			},
			editable: true,
			events: arrList
		});	
	});

</script>
<style type="text/css">
	#calendar {
		width: 800px;
		margin: 0 auto;
		float: left;
		}

</style>
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
	
		<div id="con1" align="left">
			<jsp:include page="bookManageConNav.jsp"/>
		</div>
	
		<div id="#con2" align="left">
			<h3 style="float: left;"> 도서 출간 일정</h3>
			<input style="float: right;" type="button" value="신간도서등록" onclick="location.href='${root}/bookManage/bookInsert.do?pageNumber=0'" />
			<div id="calendar"></div>
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