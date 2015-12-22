<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>사이드 메뉴</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/myPage/category.css"/>
</head>
<body>
	<table class="table table-bordered">
	    <tr style="color:white">
		    <td style="background:#37415a"><a id="tda" href="${root}/myPage/myPageOrderList.do">주문내역</a></td>
     	</tr>
		
		<tr style="color:white">
		    <td style="background:#37415a"><a id="tda" href="${root}/myPage/myPageCoupon.do">쿠폰함</a></td>
		</tr>
		
		<tr style="color:white">
		    <td style="background:#37415a"><a id="tda" href="${root}/myPage/myPagePoint.do">포인트함</a></td>
		</tr>
		
		<tr style="color:white">
		    <td style="background:#37415a"><a id="tda" href="${root}/member/update.do">회원수정</a></td>
		</tr>
		
		<tr style="color:white">
		    <td style="background:#37415a"><a id="tda" href="${root}/member/delete.do">회원탈퇴</a></td>
		</tr>
	</table>
		
</body>
</html>