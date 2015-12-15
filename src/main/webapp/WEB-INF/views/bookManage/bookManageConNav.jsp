<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	
	<a href="${root}/bookManage/bookInsert.do">도서등록</a><br/>
	<a href="${root}/bookManage/bookStockList.do">재고관리</a><br/>
	<a href="">특가설정</a><br/>
	<a href="${root}/bookManage/bookSoldOutList.do">품절도서목록</a><br/>
	<hr width="80px" align="left"/>
	<a href="">재입고신청</a><br/>
	<a href="${root}/bookManage/bookReOrderList.do">재입고현황</a><br/>
	<hr width="80px" align="left"/>
	<a href="${root}/bookManage/bookGroupPurchase.do">공동구매</a><br/>
	<hr width="80px" align="left"/>
	<a href="${root}/bookManage/bookSchedule.do">출간일정관리</a><br/>
</body>
</html>