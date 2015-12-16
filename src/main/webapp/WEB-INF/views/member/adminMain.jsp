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
		<div id="header" style="height: 227px">
			<jsp:include page="../main-top.jsp"/>
		</div>
		
		<div id="nav">
			<a href="${root}/member/adminMain.do"><b> 관리자 페이지 </b></a><br/>
		</div>
		<div id="contents" style="height:600px; background:white; border:1px solid black">
		<div id="con1" align="left" style="height:300px;">
			<a href="${root}/bookManage/bookManage.do">도서관리</a><br/>
			<a href="${root}/memberManager/memberManagerUpdate.do">관리자정보수정</a><br/>
			<a href="${root}/memberManager/memberManagerUpdate.do">쿠폰관리</a><br/>
			<a href="${root}/location/locationWrite.do">지점등록</a><br/>
			<a href="${root}/location/locationList.do">지점목록</a><br/>
			<a href="${root}/help/adminHelpQnAWrite.do">QnA등록</a><br/>
			<a href="${root}/help/adminHelpQnAList.do">QnA목록으로</a><br/>
			<a href="${root}/sales/salesDailyList.do">매출관리</a><br/>
			<a href="${root}/help/adminHelpNoticeWrite.do">공지사항등록하기</a><br/>
			<a href="${root}/help/adminHelpNoticeList.do">공지사항목록으로</a><br/>
		</div>
	
		<div id="#con2" align="left">
			
		</div>
		</div>
		<div id="footer" style="height: 195px">
			<jsp:include page="../main-bottom.jsp"/>
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