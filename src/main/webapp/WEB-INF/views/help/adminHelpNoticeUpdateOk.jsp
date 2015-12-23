<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<jsp:include page="../admin-top.jsp"/>
<meta charset="UTF-8">
<title>공지사항 수정 Ok</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
</head>
<body>
	<c:if test="${check > 0}">
		<script type="text/javascript">
			alert("글이 수정 되었습니다.");
			location.href="${root}/help/adminHelpNoticeList.do";
		</script>
	</c:if>
	
	<c:if test="${check == 0}">
		<script type="text/javascript">
			alert("글이 수정 되지 않았습니다.");
			location.href="${root}/help/adminHelpNoticeList.do";
		</script>
	</c:if>
</body>
</html>
