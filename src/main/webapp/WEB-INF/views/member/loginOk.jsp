<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${root}/css/member/style.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="${root}/script/member/script.js"></script>
<jsp:include page="../main-top.jsp"/>
</head>
<body>
	<c:if test="${loginId != null }">
		<c:set var="id" value="${loginId }" scope="session"/>
		
		<script type="text/javascript">
			location.href="${root}/member/goBookMain.do";
		</script>
	</c:if>
	
	<c:if test="${loginId == null }">
		<script type="text/javascript">
			location.href="${root}/member/login.do";
		</script>
	</c:if>
</body>
</html>