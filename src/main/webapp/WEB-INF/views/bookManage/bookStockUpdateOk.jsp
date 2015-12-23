<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../admin-top.jsp"/>
<meta charset="UTF-8">
<title>도서 입고 신청</title>
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	
	<c:if test="${check>0}">
	<script type="text/javascript">
		alert("도서 입고가 요청 되었습니다.");
		var pageInfo="${pageInfo}";
		if(pageInfo=="bookSchedule") location.href="${root}/bookManage/bookSchedule.do";
		else if (pageInfo=="bookROCL") location.href="${root}/bookManage/bookReOrderCountList.do?pageNumber=${pageNumber}";
		else if (pageInfo=="bookSOL") location.href="${root}/bookManage/bookSoldOutList.do?pageNumber=${pageNumber}";
		else if (pageInfo=="bookSL") location.href="${root}/bookManage/bookStockList.do?pageNumber=${pageNumber}";
		else if (pageInfo=="bookSP") location.href="${root}/bookManage/bookSpecialPrice.do?pageNumber=${pageNumber}";
		else location.href="${root}/bookManage/bookList.do?pageNumber=${pageNumber}";
	</script>
	</c:if>
	<c:if test="${check==0}">
	<script type="text/javascript">
		alert("도서 입고 요청에 문제가 발생하였습니다.");
		location.href="${root}/bookManage/bookList.do";
	</script>
	</c:if>
</body>
</html>