<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:set var="date" value="<%=new Date() %>"/>
<fmt:formatDate var="today" value="${date}" pattern="yyyy"/>
<fmt:formatDate var="birth" value="${memberDto.member_birth}" type="date" pattern="yyyy/MM/dd"/>
<html>
<head>
<jsp:include page="../main-top.jsp"/>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${root}/script/member/script.js"></script>
<title>GoBookGoBook</title>
</head>
<body>

	<c:if test="${check >0 }">
		<script type="text/javascript">
			alert("회원정보수정이 완료 되었습니다.");
			location.href="${root}/member/goBookMain.do"
		</script>
	</c:if>
	
	<c:if test="${check ==0 }">
		<script type="text/javascript">
			alert("회원정보수정이 되지 않았습니다.");
			location.href="${root}/member/update.do"
		</script>
	</c:if>
</body>
</html>