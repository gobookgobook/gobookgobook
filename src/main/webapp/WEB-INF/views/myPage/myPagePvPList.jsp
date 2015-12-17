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
	<c:if test="${id==null}">
		<h3 align="center">회원가입 혹은 로그인을 해주세여</h3>
		<div align="center">
			<a href="${root}/member/register.do">회원가입</a> <a href="${root}/member/login.do">로그인</a>
		</div>
	</c:if>
	<c:if test="${id!=null }">
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
				
			<c:if test="${myPagePvPList.size() > 0}">	
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
			</c:if>
			<c:if test="${myPagePvPList.size()==0}">
				<div class="pvpList_body" style="text-align: center; font-size: 20">
				문의한 내용이 없습니다.
				</div>
			</c:if>
			</div>	
		</div>
		</c:if>
	</div>
</body>
</html>