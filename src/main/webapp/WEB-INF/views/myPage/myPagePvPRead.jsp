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
		1:1문의
		<hr>
			<div class="myPagePvPRead">
				<div class="pvpRead_title">
					제목: ${helpPvPDto.helppvp_user_subject}
				</div>
				<Br/>
				<div class="pvpRead_user_subject">
				회원의 질문 입니다.
				</div>
				<div class="pvpRead_user_content">
				${helpPvPDto.helppvp_user_content}
				</div>
				<div class="pvpRead_user_subject">
				관리자 답변입니다.
				</div>
				<div class="pvpRead_admin_content">
				<c:if test="${helpPvPDto.helppvp_admin_content != null}">
				${helpPvPDto.helppvp_admin_content}
				</c:if>
				<c:if test="${helpPvPDto.helppvp_admin_content == null}">
				<span style="text-align: center;">답변을 기다리고 있습니다.</span>
				</c:if>
				</div>
			</div>	
		</div>
	</div>
</body>
</html>