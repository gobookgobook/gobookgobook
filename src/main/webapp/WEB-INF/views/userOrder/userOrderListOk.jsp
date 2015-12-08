<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <c:set var="root" value="${pageContext.request.contextPath}"/>
   
   	<c:if test="${check>0}">
	<script type="text/javascript">
		alert("주문이 완료되었습니다.");
		location.href="${root}/userOrder/userOrderListOk.do"
	</script>
	</c:if>
	<c:if test="${check==0}">
	<script type="text/javascript">
		alert("주문을 실패하였습니다.");
		location.href="${root}/userOrder/userOrderList.do"
	</script>
	</c:if>
</body>
</html>