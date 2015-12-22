<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공구 수정</title>
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	
	<c:if test="${check>0}">
	<script type="text/javascript">
		alert("공동구매 정보가 수정되었습니다.");
		location.href="${root}/bookManage/bookGroupPurchase.do"
	</script>
	</c:if>
	<c:if test="${check==0}">
	<script type="text/javascript">
		alert("공동구매 정보 수정에 문제가 발생하였습니다.");
		location.href="${root}/bookManage/bookGroupPurchase.do"
	</script>
	</c:if>
</body>
</html>