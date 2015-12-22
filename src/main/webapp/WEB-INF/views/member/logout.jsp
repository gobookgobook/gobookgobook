<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>GoBookGoBook</title>
<link href="${root}/css/member/style.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="${root}/script/member/script.js"></script>
</head>
<body>
	<c:remove var="id" scope="session"/>
	<c:remove var="memberLevel" scope="session"/>
	
	<script type="text/javascript">
		location.href="${root}/member/goBookMain.do";
	</script>
</body>
</html>