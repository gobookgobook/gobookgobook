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
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/event/tablea.css"/>
</head>
<body>
<table class="table table-bordered">
		<tr style="color:white">
			<td style="background:#41AF39"><a id="tda" href="${root}/event/eventList.do">이벤트 목록</a></td>
		</tr>
		
		<tr style="color:white">
			<td style="background:#41AF39"><a id="tda" href="${root}/event/eventWrite.do">이벤트 등록</a></td>
		</tr>
		
	</table>
</body>
</html>