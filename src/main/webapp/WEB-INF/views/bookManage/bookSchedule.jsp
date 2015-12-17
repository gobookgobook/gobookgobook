<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
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
<jsp:include page="../admin-top.jsp"/>
</head>
<body>
	<c:set var="id" value="admin" scope="session"/>
	<div id="contents" style="background:white; border:0px solid black">
	<c:if test="${id=='admin'}">
		<div style="background-color: #41AF39;margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
			<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;도서 관리</b>
		</div>
		
		<div align="left" style="width: 120px;height: 1000px;float: left;">
			<jsp:include page="bookManageConNav.jsp"/>
		</div>
			
		<div align="left" style="float: left;margin: 20px 0 0 50px;width: 80%;">
			<h3 style="float: left;"> 도서 출간 일정</h3>
			<input style="float: right;" type="button" value="신간도서등록" onclick="location.href='${root}/bookManage/bookInsert.do?pageNumber=0'" />
			<div id="calendar"></div>
		</div>
	</c:if>
	</div>
	<c:if test="${id!='admin'}">
		<script type="text/javascript">
			alert("관리자만 접근이 가능한 페이지 입니다");
			location.href="${root}/member/goBookMain.do"
		</script>
	</c:if>
</body>
</html>