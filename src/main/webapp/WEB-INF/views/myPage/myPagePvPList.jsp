<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/myPage/helppvp.css"/>
</head>
<body>	
	<div>
		<div class="title">
		※마이페이지
		</div>
		<jsp:include page="category.jsp"/>
		<div class="body">
		1:1문의 내역
		<hr>
			<div class="myPagePvPList">
				<div class="pvpList_title">
					<div class="pvpList_write_date">
					작성일
					</div>
					<div class="pvpList_user_name">
					제목
					</div>
					<div class="pvpList_user_read">
					답변여부
					</div>
				</div>
				
			<c:forEach var="myPagePvPList" items="${myPagePvPList}">	
				<div class="pvpList_body">
				<input type="hidden" value="${myPagePvPList.helppvp_num}" name="helppvp_num">
				
					<div class="pvpList_write_date">
					<fmt:formatDate value="${myPagePvPList.helppvp_write_date}" pattern="yyyy-MM-dd"/>
					</div>
					<div class="pvpList_user_name">
					<a href="${root}/myPage/myPagePvPRead.do?helppvp_num=${myPagePvPList.helppvp_num}">${myPagePvPList.helppvp_user_subject}</a>
					</div>
					<div class="pvpList_user_read">
					${myPagePvPList.helppvp_user_read}
					</div>
				</div>
			</c:forEach>	
			</div>	
		</div>
	</div>
</body>
</html>