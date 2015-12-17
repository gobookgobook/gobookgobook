<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/bookManage/style.css"/>
</head>
<body>
	<div style="background-color: #41AF39;margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
		<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;회원관리</b>
	</div>
	<table class="table table-bordered">
		<tr>
			<td style="background:#41AF39"><a id="tda" href="${root}/memberManager/memberManageCouponList.do" >쿠폰 목록</a></td>
		</tr>
		
		<tr style="color:white">
			<td style="background:#41AF39"><a id="tda" href="${root}/memberManager/memberManageCouponInsert.do">쿠폰 생성</a></td>
		</tr>
		
		<tr style="color:white">
			<td style="background:#41AF39"><a id="tda" href="${root}/memberManager/memberManagerUpdate.do">관리자 정보 수정</a></td>
		</tr>
	</table>
</body>
</html>
</body>
</html>