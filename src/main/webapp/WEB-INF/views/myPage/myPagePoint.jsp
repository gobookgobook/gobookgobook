<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/myPage/point.css"/>
<jsp:include page="../main-top.jsp"/>
</head>
<body>
	<br/><br/>

<div id="contents" style="height:500px; background:white; border:1px solid black"><br/><br/><br/><br/>
	<div class="all">
	<c:if test="${id==null}">
		<h3 align="center">회원가입 혹은 로그인을 해주세여</h3>
		<div align="center">
			<a href="${root}/member/register.do">회원가입</a> <a href="${root}/member/login.do">로그인</a>
		</div>
	</c:if>
	<c:if test="${id !=null }">
		<jsp:include page="category.jsp"/>
		<div class="body">
		포인트 함
		<hr>
			<div class="point_title">
				현재 보유중인 포인트
			</div>
			<div class="point_body">
				<c:if test="${member_point > 0 }">
					${member_point}
				</c:if>
				<c:if test="${member_point == 0 || member_point ==null }">
					현재 보유중인 포인트가 없습니다.
				</c:if>	
			</div>
		</div>
		</c:if>
	</div>
</div>
<%-- <jsp:include page="../main-bottom.jsp"/> --%>
	<br/><br/>
</body>
</html>