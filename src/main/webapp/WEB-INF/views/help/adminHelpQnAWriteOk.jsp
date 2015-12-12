<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>QnA등록Ok</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link href="${root}/css/help/style.css" type="text/css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../member/menu.jsp"/>
   <br/><br/>
    <c:set var="root" value="${pageContext.request.contextPath}"/>
	<c:if test="${check > 0}">
		<script type="text/javascript">
			alert("글이 작성 되었습니다.");
			location.href="${root}/help/adminHelpQnAList.do";
		</script>
	</c:if>
	
	<c:if test="${check == 0}">
		<script type="text/javascript">
			alert("글 작성에 실패 하셧습니다.");
			location.href="${root}/help/adminHelpQnAWrite.do";
		</script>
	</c:if>
</body>
</html>
