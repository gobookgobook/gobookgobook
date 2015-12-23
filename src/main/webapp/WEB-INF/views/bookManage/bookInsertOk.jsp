<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../admin-top.jsp"/>
<meta charset="UTF-8">
<title>도서 등록</title>
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	
	<c:if test="${check>0}">
	<script type="text/javascript">
		alert("도서 등록이 완료 되었습니다.");
		var pageInfo="${pageInfo}";
		if(pageInfo=="bookSchedule") location.href="${root}/bookManage/bookSchedule.do";
		else location.href="${root}/bookManage/bookStockList.do?pagenumber=${pageNumber}";
		
	</script>
	</c:if>
	<c:if test="${check==0}">
	<script type="text/javascript">
		alert("도서 등록에 문제가 발생하였습니다.");
		location.href="${root}/bookManage/bookInsert.do"
	</script>
	</c:if>
</body>
</html>