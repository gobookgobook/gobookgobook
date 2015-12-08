<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<link href="${root}/css/member/style.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="${root}/script/member/script.js"></script>
<title>GoBookGoBook</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<br/><br/>
	
	<c:if test="${id!=null}">
		<div align="center" style="margin-top: 200px;">
			안녕하세요. <c:out value="${id}"/>님 <br/>
			즐거운시간되세요.
		</div>
	</c:if>
	
	<c:if test="${id==null}">
		<div align="center" style="margin-top: 200px;">
			회원가입 후 더 많은 정보를 이용하세요.
		</div>
	</c:if>
</body>
</html>