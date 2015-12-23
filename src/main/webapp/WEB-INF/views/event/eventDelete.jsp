<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 삭제</title>
<jsp:include page="../admin-top.jsp"/>
</head>
<body>
    <c:if test="${check > 0}">
		<script type="text/javascript">
			alert("이벤트가 삭제 되었습니다.");
			location.href="${root}/event/eventList.do";
		</script>
	</c:if>
	
	<c:if test="${check == 0}">
		<script type="text/javascript">
			alert("이벤트가 삭제되지 않았습니다.");
			location.href="${root}/event/eventRead.do";
		</script>
	</c:if>
</body>
</html>