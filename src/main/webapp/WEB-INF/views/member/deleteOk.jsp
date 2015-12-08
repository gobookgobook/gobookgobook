<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link href="${root}/css/member/style.css" type="text/css" rel="stylesheet"/>
</head>
<body>
	<c:if test="${check > 0}">
		<c:remove var="id" scope="session"/>
		
		<script type="text/javascript">
			alert("회원탈퇴가 완료되었습니다.");
			location.href="${root}/member/goBookMain.do";
		</script>
	</c:if>
	
	<c:if test="${check == 0}">
		<script type="text/javascript">
			alert("회원탈퇴 되지 않았습니다.");
			location.href="${root}/member/delete.do";
		</script>
	</c:if>
</body>
</html>