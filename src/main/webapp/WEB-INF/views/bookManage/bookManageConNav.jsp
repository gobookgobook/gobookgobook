<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>도서 관리 사이드메뉴</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/bookManage/tablea.css"/>
</head>
<body>	
	<table class="table table-bordered">
		<tr>
			<td style="background:#41AF39"><a id="tda" href="${root}/bookManage/bookInsert.do" >도서등록</a></td>
		</tr>
		
		<tr style="color:white">
			<td style="background:#41AF39"><a id="tda" href="${root}/bookManage/bookList.do">도서목록</a></td>
		</tr>
		
		<tr style="color:white">
			<td style="background:#41AF39"><a id="tda" href="${root}/bookManage/bookStockList.do">재고관리</a></td>
		</tr>
		
		<tr style="color:white">
			<td style="background:#41AF39"><a id="tda" href="${root}/bookManage/bookSoldOutList.do">품절도서목록</a></td>
		</tr>
		
		<tr style="color:white">
			<td style="background:#41AF39"><a id="tda" href="${root}/bookManage/bookManage.do">고객도서요청</a></td>
		</tr>
		
		<tr style="color:white">
			<td style="background:#41AF39"><a id="tda" href="${root}/bookManage/bookReOrderList.do">재입고현황</a></td>
		</tr>
		
		<tr style="color:white">
			<td style="background:#41AF39"><a id="tda" href="${root}/bookManage/bookGroupPurchase.do">공동구매</a></td>
		</tr>
		
		<tr style="color:white">
			<td style="background:#41AF39"><a id="tda" href="${root}/bookManage/bookSchedule.do">출간일정관리</a></td>
		</tr>
	</table>
</body>
</html>