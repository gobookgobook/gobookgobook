<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:set var="date" value="<%=new Date() %>"/>
<fmt:formatDate var="today" value="${date}" pattern="yyyy"/>
<fmt:formatDate var="birth" value="${memberDto.member_birth}" type="date" pattern="yyyy/MM/dd"/>
<html>
<head>
<meta charset="UTF-8">
<link href="${root}/css/member/style.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="${root}/script/member/script.js"></script>
<title>Insert title here</title>
</head>
<body>
	<c:if test="${check >0 }">
		<script type="text/javascript">
			location.href="${root}/member/goBookMain.do"
		</script>
	</c:if>
	
	<c:if test="${check ==0 }">
		<script type="text/javascript">
			location.href="${root}/member/update.do"
		</script>
	</c:if>
</body>
</html>