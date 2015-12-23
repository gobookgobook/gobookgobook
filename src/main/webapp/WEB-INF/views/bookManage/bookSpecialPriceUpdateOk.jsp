<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../admin-top.jsp"/>
<meta charset="UTF-8">
<title>도서 특가 설정</title>
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	
	<c:if test="${check>0}">
	<script type="text/javascript">
		alert("도서 특별 할인 가격이 적용되었습니다.");
		location.href="${root}/bookManage/bookSpecialPrice.do?pageNumber=${pageNumber}";
	</script>
	</c:if>
	<c:if test="${check==0}">
	<script type="text/javascript">
		alert("도서 특가 설정에 문제가 발생하였습니다.");
		location.href="${root}/bookManage/bookSpecialPrice.do";
	</script>
	</c:if>
</body>
</html>