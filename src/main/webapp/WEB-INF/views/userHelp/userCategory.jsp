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
</head>
<body>
	<table class="table table-bordered">
	

	    <tr style="color:white">
		    <td style="background:#6799FF"><a id="tda" href="#">1:1문의</a></td>
     	</tr>
     	
     	<tr style="color:white">
		    <td style="background:#6799FF"><a id="tda" href="${root}/userHelp/userHelpQnA.do">Q&A</a></td>
		</tr>
		
		<tr style="color:white">
		    <td style="background:#6799FF"><a id="tda" href="${root}/userHelp/userHelpNotice.do">공지사항</a></td>
		</tr>
		
		<tr style="color:white">
		    <td style="background:#6799FF"><a id="tda" href="${root}/userHelp/userHelpLocation.do">지점확인</a></td>
		</tr>
		
	</table>
</body>
</html>