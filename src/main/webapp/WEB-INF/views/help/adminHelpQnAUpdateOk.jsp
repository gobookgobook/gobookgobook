<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<jsp:include page="../admin-top.jsp"/>
<meta charset="UTF-8">
<title>QnA수정 확인</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link href="${root}/css/help/style.css" type="text/css" rel="stylesheet">
</head>
<body>
	
	<c:if test="${check > 0}">
		<script type="text/javascript">
			alert("글이 수정 되었습니다.");
			location.href="${root}/help/adminHelpQnAList.do";
		</script>
	</c:if>
	
	<c:if test="${check == 0}">
		<script type="text/javascript">
			alert("글이 수정 되지 않았습니다.");
			location.href="${root}/help/adminHelpQnAList.do";
		</script>
	</c:if>
</body>
</html>
