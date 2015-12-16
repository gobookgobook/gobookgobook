<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/userBook/userBookInterest.css"/>
</head>
<body>
	<div class="interestAll">
	<c:if test="${id !=null }">
		<c:if test="${book !=null}">
			<div class="interestBody">
				<c:forEach var="interestBook" items="${book}">				
					<div class="interest">
						<a href="#">
							<img src="#" height="80%" width="100%"/>
						</a>
						<label>
							${interestBook.book_name}
						</label>
					</div>	
				</c:forEach>
			</div>
		</c:if>
		<c:if test="${book ==null }">
			관심분야를 선택해 주세요.
		</c:if>
	</c:if>
	<c:if test="${id == null }">
		회워 가입후 이용 가능합니다.
	</c:if>
	</div>	
</body>
</html>