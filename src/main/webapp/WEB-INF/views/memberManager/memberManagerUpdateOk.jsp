<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>    
<html>
<head>
<jsp:include page="../admin-top.jsp"/>
<meta charset="UTF-8">
<title>GoBookGoBook</title>
<link rel="stylesheet" type="text/css" href="${root}/css/memberManage/memberManage.css"/>
<script type="text/javascript" src="${root}/script/memberManage/memberManager.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
	<c:if test="${value >0 }">
		<script type="text/javascript">
			alert("관리자 정보가 수정되었습니다.");
			location.href="${root}";
		</script>
	</c:if>
	
		<c:if test="${value ==0 }">
		<script type="text/javascript">
			alert("다시 입력해주세요.");
			location.href="${root}/memberManager/memberManagerUpdate.do";
		</script>
	</c:if>
</body>
</html>