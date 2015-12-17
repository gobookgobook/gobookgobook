<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	
	<table class="table table-bordered">
	<tr>
		<td style="background:#41AF39"><a href="${root}/sales/salesDailyList.do">일일매출</a></td>
	</tr>
	
	<tr style="color:white">
		<td style="background:#41AF39"><a href="${root}/sales/salesMonthlyList.do">월별매출</a></td>
	</tr>
	</table>
	
</body>
</html>