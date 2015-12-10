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
	<div id="wrap">
		<div id="header">
			<h1>GoBook!GoBook!</h1>
		</div>
		
		<div id="nav">
			<a href="${root}/bookManage/bookManage.do"><b> 도서관리 </b></a><br/>
		</div>
	
		<div id="con1" align="left" style="height:300px;">
			<a href="${root}/bookManage/bookInsert.do">도서등록</a><br/>
			<a href="${root}/bookManage/bookStockList.do">재고관리</a><br/>
			<a href="">특가설정</a><br/>
			<a href="${root}/bookManage/bookSoldOutList.do">품절도서목록</a><br/>
			<hr width="80px" align="left"/>
			<a href="">재입고신청</a><br/>
			<a href="${root}/bookManage/bookReOrderList.do">재입고현황</a><br/>
			<hr width="80px" align="left"/>
			<a href="">공동구매</a><br/>
			<a href="">출간일정관리</a><br/>
		</div>
	
		<div id="#con2" align="left">
			<h3>재입고 요청</h3>
			<a href="${root}/bookManage/bookReOrderCount.do">재입고 요청 내역</a>
			<br/><br/><br/>
			
			<h3>공동구매 현황</h3>
			<a href="">공동구매 진행현황</a>
			<br/><br/>
			<a href="">현재 진행중인 공구</a>
			<br/><br/><br/>
			
			<h3>공동구매 요청</h3>
			<a href="${root}/bookManage/bookGroupPurchaseCount.do">공동구매 요청 내역</a>
			<br/><br/>
		</div>
	</div>
</body>
</html>