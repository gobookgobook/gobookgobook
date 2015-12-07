<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<meta charset="UTF-8">
	<title>Home</title>
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	<a href="${root}/bookManage/bookInsert.do">BookInsert</a><br/>

	<P>  The time on the server is ${serverTime}. </P>


	<h2> test</h2>
</body>
</html>
