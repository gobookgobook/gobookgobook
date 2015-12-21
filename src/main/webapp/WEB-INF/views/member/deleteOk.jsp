<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<jsp:include page="../main-top.jsp"/>
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
<jsp:include page="../main-bottom.jsp"/>
	<br/><br/>		
</body>
</html>