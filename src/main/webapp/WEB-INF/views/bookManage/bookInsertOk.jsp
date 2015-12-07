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
	
	<c:if test="${check>0}">
	<script type="text/javascript">
		alert("게시판 글이 작성되었습니다.");
		location.href="${root}/"
	</script>
	</c:if>
	<c:if test="${check==0}">
	<script type="text/javascript">
		alert("게시판 글 작성에 문제가 발생하였습니다.");
		location.href="${root}/"
	</script>
	</c:if>
</body>
</html>