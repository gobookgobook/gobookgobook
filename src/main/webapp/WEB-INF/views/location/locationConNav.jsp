<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/bookManage/tablea.css"/>
</head>
<body>
	<table class="table table-bordered">
		<tr>
			<td style="background:#41AF39"><a id="tda" href="${root}/location/locationWrite.do" >지점등록</a></td>
		</tr>
		
		<tr>
			<td style="background:#41AF39"><a id="tda" href="${root}/location/locationList.do">지점목록</a></td>
		</tr>
	</table>
</body>
</html>