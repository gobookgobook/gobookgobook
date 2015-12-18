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
<link rel="stylesheet" type="text/css" href="${root}/css/userBook/bookCategory.css"/>
</head>
<body>
	<table class="table table-bordered">
	

	    <tr style="color:white">
		    <td style="background:#6799FF"><a href="${root}/userBook/userBookList.do?category=${'문학'}">문학</a></td>
     	</tr>
     	
     	<tr style="color:white">
		    <td style="background:#6799FF"><a href="${root}/userBook/userBookList.do?category=${'교육도서'}">교육도서</a></td>
		</tr>
		
		<tr style="color:white">
		    <td style="background:#6799FF"><a href="${root}/userBook/userBookList.do?category=${'전공도서'}">전공도서</a></td>
		</tr>
		
		<tr style="color:white">
		    <td style="background:#6799FF"><a href="${root}/userBook/userBookList.do?category=${'만화'}">만화</a></td>
		</tr>
		
		<tr style="color:white">
		    <td style="background:#6799FF"><a href="${root}/userBook/userBookList.do?category=${'잡지'}">잡지</a></td>
		</tr>
		
		<tr style="color:white">
		    <td style="background:#6799FF"><a href="${root}/userBook/userBookList.do?category=${'역사'}">역사</a></td>
		</tr>
		
		<tr style="color:white">
		    <td style="background:#6799FF"><a href="${root}/userBook/userBookList.do?category=${'SF/판타지'}">SF/판타지</a></td>
		</tr>
		
		<tr style="color:white">
		    <td style="background:#6799FF"><a href="${root}/userBook/userBookList.do?category=${'교양도서'}">교양도서</a></td>
		</tr>
		
		<tr style="color:white">
		    <td style="background:#6799FF"><a href="${root}">메인</a></td>
		</tr>
		
		<tr style="color:white">
		    <td style="background:#6799FF"><a href="${root}/userBook/userBookGroupPurchaseList.do">공구목록</a></td>
		</tr>
	</table>
</body>
</html>