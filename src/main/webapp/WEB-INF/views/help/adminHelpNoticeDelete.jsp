<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 삭제</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
</head>
<body>
	<c:if test="${check > 0}">
		<script type="text/javascript">
			alert("게시물을 삭제 하였습니다.");
			location.href="${root}/help/adminHelpNoticeList.do";
		</script>
	</c:if>
</body>
</html>
