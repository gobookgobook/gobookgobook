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
	<c:if test="${count > 0}">
		<script type="text/javascript">
			alert("정산이 완료되었습니다. 월별매출 메뉴로 이동합니다.");
			location.href="${root}/sales/salesMonthlyList.do";
		</script>
	</c:if>
	
	<c:if test="${count ==0}">
		<script type="text/javascript">
			alert("정산이 제대로 되지 않았습니다. 일일매출 메뉴로 이동합니다.");
			location.href="${root}/sales/salesDailyList.do";
		</script>
	</c:if>
</body>
</html>