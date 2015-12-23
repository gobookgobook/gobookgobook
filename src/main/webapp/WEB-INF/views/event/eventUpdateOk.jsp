<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../admin-top.jsp"/>
</head>
<body>
    <c:if test="${check > 0}">
		<script type="text/javascript">
			alert("수정 성공 하였습니다.");
			location.href="${root}/event/eventList.do";
		</script>
	</c:if>
	
	<c:if test="${check == 0}">
		<script type="text/javascript">
			alert("수정 실패 하셨습니다.");
			location.href="${root}/event/eventUpdate.do";
		</script>
	</c:if>
</body>
</html>