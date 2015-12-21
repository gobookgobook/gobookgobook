<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/memberManage/memberManage.css"/>
</head>
<body>
	<table class="table table-bordered">
	
	    <tr style="color:white;">
		    <td style="background:#41AF39;"><a id="tda" href="${root}/memberManager/memberManageCouponList.do" >쿠폰 목록</a></td>
     	</tr>
     	
     	<tr style="color:white">
		    <td style="background:#41AF39;"><a id="tda" href="${root}/memberManager/memberManageCouponInsert.do">쿠폰 생성</a></td>
		</tr>
		
		<tr style="color:white">
		    <td style="background:#41AF39;"><a id="tda" href="${root}/memberManager/memberManagerUpdate.do">관리자정보 수정</a></td>
		</tr>
	</table>
</body>
</html>
</body>
</html>