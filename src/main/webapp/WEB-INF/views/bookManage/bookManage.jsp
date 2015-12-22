<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<jsp:include page="../admin-top.jsp"/>
<meta charset="UTF-8">
<title>도서관리 메인</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
	<div id="contents" style="background:white; border:0px solid black">
	<c:if test="${id=='admin'}">
		<div style="margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
			<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;> 도서 관리</b>
		</div>
		
		<div align="left" style="width: 110px;float: left;">
			<jsp:include page="bookManageConNav.jsp"/>
		</div>
			
		<div align="left" style="float: left;margin: 0 0 0 50px;width: 80%;">
			<div align="center"><b style="font-size: 18px;">신간 구매 요청</b></div>
			<br/>
			<div align="center">
				<c:if test="${bookNewPublishCount!=0}">
					<a href="${root}/bookManage/bookNewPublishList.do">신간 구매 요청이 ${bookNewPublishCount}권 있습니다.</a>
				</c:if>
				<c:if test="${bookNewPublishCount==0}">
					신간 도서 입고 요청이 없습니다.
				</c:if>
			</div>
			
			<br/><br/>
			<div align="center"><b style="font-size: 18px;">재입고 요청</b></div>
			<br/>
			<div align="center">
				<c:if test="${bookReOrderCount!=0}">
					<a href="${root}/bookManage/bookReOrderCount.do">재입고 요청 도서가 ${bookReOrderCount}권 있습니다.</a>
				</c:if>
				<c:if test="${bookReOrderCount==0}">
					품절도서 재입고 요청이 없습니다.
				</c:if>
			</div>
			
			<br/><br/>
			<div align="center"><b style="font-size: 18px;">공동구매 현황</b></div>
			<br/>
			<div align="center">
				<c:if test="${bookGroupPurchaseListCount!=0}">
					<a href="${root}/bookManage/bookGroupPurchase.do">현재 공동구매가 ${bookGroupPurchaseListCount}건 진행되고 있습니다.</a>
				</c:if>
				<c:if test="${bookGroupPurchaseListCount==0}">
					진행중인 공동구매가 없습니다.
				</c:if>
				<br/><br/>
				
				<c:if test="${bookGroupPurchaseCount!=0}">
					<a href="${root}/bookManage/bookGroupPurchase.do">공동구매 요청 도서가 ${bookGroupPurchaseCount}권 있습니다.</a>
				</c:if>
				<c:if test="${bookGroupPurchaseCount==0}">
					공동구매 요청도서가 없습니다.
				</c:if>
			</div>
		</div>
	</c:if>
	<c:if test="${id!='admin'}">
		<script type="text/javascript">
			alert("관리자만 접근이 가능한 페이지 입니다");
			location.href="${root}/member/goBookMain.do"
		</script>
	</c:if>
	</div>
	<div style="margin-top: -150px">
		<jsp:include page="../main-bottom.jsp"/>
	</div>	
</body>
</html>