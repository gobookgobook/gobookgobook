<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>    
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${value >0 }">
		<script type="text/javascript">
			alert("관리자 정보가 수정되었습니다.");
			Location.href="${root}";
		</script>
	</c:if>
	
		<c:if test="${value ==0 }">
		<script type="text/javascript">
			alert("다시 입력해주세요.");
			Location.href="${root}/memberManager/memberManagerUpdate.do";
		</script>
	</c:if>
</body>
</html>