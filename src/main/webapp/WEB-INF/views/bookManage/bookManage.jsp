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
	<c:set var="id" value="admin" scope="session"/>
	<c:if test="${id=='admin'}">
	<div id="wrap">
		<div id="header">
			<h1>GoBook!GoBook!</h1>
		</div>
		
		<div id="nav">
			<a href="${root}/bookManage/bookManage.do"><b> 도서관리 </b></a><br/>
		</div>
	
		<div id="con1" align="left" style="height:300px;">
			<jsp:include page="bookManageConNav.jsp"/>
		</div>
	
		<div id="#con2" align="left">
			<h3>재입고 요청</h3>
			<c:if test="${bookReOrderCount!=0}">
				<a href="${root}/bookManage/bookReOrderCount.do">재입고 요청 도서가 ${bookReOrderCount}권 있습니다.</a>
			</c:if>
			<c:if test="${bookReOrderCount==0}">
				품절도서 재입고 요청이 없습니다.
			</c:if>
			<br/><br/><br/>
			
			<h3>공동구매 현황</h3>
			<c:if test="${bookGroupPurchaseListCount!=0}">
				<a href="${root}/bookManage/bookGroupPurchase.do">현재 공동구매가 ${bookGroupPurchaseListCount}건 진행되고 있습니다.</a>
			</c:if>
			<c:if test="${bookGroupPurchaseListCount==0}">
				진행중인 공동구매가 없습니다.
			</c:if>
			<br/><br/><br/>
			
			<c:if test="${bookGroupPurchaseCount!=0}">
				<a href="${root}/bookManage/bookGroupPurchase.do">공동구매 요청 도서가 ${bookGroupPurchaseCount}권 있습니다.</a>
			</c:if>
			<c:if test="${bookGroupPurchaseCount==0}">
				공동구매 요청도서가 없습니다.
			</c:if>
			<br/>
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