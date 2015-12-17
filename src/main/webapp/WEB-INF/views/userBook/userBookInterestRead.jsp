<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../main-top.jsp"/>
</head>
<link rel="stylesheet" type="text/css" href="${root}/css/userBook/userBookInterest.css"/>
<script type="text/javascript" src="${root}/script/userBook/script.js"></script>
<body>
	<br/><br/>
<div id="contents" style="height:800px; background:white; border:1px solid black"><br/><br/><br/><br/>
	<div class="interestAll">
		<div class="interestBody">
			<c:if test="${id !=null }">
				<c:if test="${book !=null }">
					<c:forEach var="interestBook" items="${book}">
						<div class="interest">
							<a href="javascript:userBookRead('${root}', '${interestBook.book_num}')">
								<img src="#" width="100%" height="80%"/>
							</a>
							${interestBook.book_name}
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${book ==null }">
					<label>관심분야를 선택해주세요.</label>
				</c:if>
			</c:if>
			
			<c:if test="${id ==null }">
				로그인 후 이용 가능합니다.
			</c:if>
		</div>
	</div>
</div>
<%-- <jsp:include page="../main-bottom.jsp"/> --%>
	<br/><br/>	
</body>
</html>