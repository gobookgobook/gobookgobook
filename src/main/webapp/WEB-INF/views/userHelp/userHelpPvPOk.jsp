<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 등록 Ok</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
</head>
<body>
	<c:if test="${check > 0}">
		<script type="text/javascript">
			alert("글이 작성 되었습니다.");
			location.href="${root}myPage/myPagePvPList.do";
		</script>
	</c:if>
	
	<c:if test="${check == 0}">
		<script type="text/javascript">
			alert("글 작성에 실패 하셧습니다.");
			location.href="${root}help/userHelpPvP.do";
		</script>
	</c:if>
</body>
</html>
