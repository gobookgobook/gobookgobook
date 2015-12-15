<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="${root}/css/bookManage/style.css"/>
</head>
<body>
	<jsp:include page="../member/menu.jsp"/>
	<br/><br/>
	<c:if test="${id=='admin'}">
	<div id="wrap">
		<div id="header">
			<h1>GoBook!GoBook!</h1>
		</div>
		
		<div id="nav">
			<a href="${root}/member/adminMain.do"><b> 관리자 페이지 </b></a><br/>
		</div>
		
		<div id="con1" align="left" style="height:300px;">
			<a href="${root}/bookManage/bookManage.do">도서관리</a><br/>
			<a href="${root}/memberManager/memberManagerUpdate.do">관리자정보수정</a><br/>
			<a href="${root}/memberManager/memberManagerUpdate.do">쿠폰관리</a><br/>
			<a href="${root}/location/locationWrite.do">지점등록</a><br/>
			<a href="${root}/help/adminHelpQnAWrite.do">QnA등록</a>
		</div>
	
		<div id="#con2" align="left">
			
		</div>
	</div>
	</c:if>
	<c:if test="${id!='admin'}">
		<script type="text/javascript">
			alert("관리자만 접근이 가능한 페이지 입니다");
			location.href="${root}/member/goBookMain.do"
		</script>
	</c:if>
</body>
</html>