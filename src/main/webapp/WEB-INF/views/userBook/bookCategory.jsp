<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/userBook/bookCategory.css"/>
</head>
<body>
<jsp:include page="../member/menu.jsp"/>
   <br/><br/>
   
	<div class="title">
		※도서 목록
	</div>
	<div class="category">
		<a href="${root}/userBook/userBookList.do?category=${1}">문학</a>
		<a href="${root}/userBook/userBookList.do?category=${2}">교육도서</a>
		<a href="${root}/userBook/userBookList.do?category=${3}">전공도서</a>
		<a href="${root}/userBook/userBookList.do?category=${4}">만화</a>
		<a href="${root}/userBook/userBookList.do?category=${5}">잡지</a>
		<a href="${root}/userBook/userBookList.do?category=${6}">역사</a>
		<a href="${root}/userBook/userBookList.do?category=${7}">SF/판타지</a>
		<a href="${root}/userBook/userBookList.do?category=${8}">교양도서</a>
		<a href="${root}">메인</a>
	</div>
</body>
</html>