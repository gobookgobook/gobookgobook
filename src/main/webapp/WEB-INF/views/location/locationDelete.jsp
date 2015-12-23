<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<jsp:include page="../admin-top.jsp"/>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${root}/css/location/style.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="${root}/script/location/script.js"></script>
<script type="text/javascript" src="${root}/script/jquery.js"></script>
<style type="text/css">
	#map {
		height: 600px;
		width: 600px;
	}
</style>
</head>
<body>
	<c:if test="${check > 0}">
		<script type="text/javascript">
			alert("지점이 폐점 되었습니다.");
			location.href="${root}/location/locationList.do";
		</script>
	</c:if>
	
	<c:if test="${check == 0}">
		<script type="text/javascript">
			alert("지점이 폐점 되지 않았습니다.");
			location.href="${root}/location/locationList.do";
		</script>
	</c:if>

</body>
</html>