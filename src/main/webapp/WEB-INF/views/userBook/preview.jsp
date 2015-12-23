<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>미리 보기</title>
</head>
<body>
	
	<c:if test="${preview.book_preview_file_name1 !=null}">
		<img alt="" src="http://localhost:8181/gobook/images/bookImg/${preview.book_preview_file_name1}" width="30%" height="90%"/>
	</c:if>
	<c:if test="${preview.book_preview_file_name2 !=null}">
		<img alt="" src="http://localhost:8181/gobook/images/bookImg/${preview.book_preview_file_name2}" width="30%" height="90%"/>
	</c:if>
	<c:if test="${preview.book_preview_file_name3 !=null}">
		<img alt="" src="http://localhost:8181/gobook/images/bookImg/${preview.book_preview_file_name3}" width="30%" height="90%"/>
	</c:if>
</body>
</html>