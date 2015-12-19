<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${root}/css/userBook/userBookList.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${root}/script/userBook/script.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<jsp:include page="../main-top.jsp"/>
</head> 	
<body>
<jsp:include page="../cookie/cookie.jsp"/>
<div id="contents" style="height:500px; background:white; border:1px solid black; position:static;">
	<div style="background-color: #6799FF;margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
			<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;도서 목록</b>
	</div>
	
	<div align="left" style="width: 120px; float:left;">
		<jsp:include page="bookCategory.jsp"/>
	</div>	
		<div class="userBookBody">
		
			<c:if test="${bookDtoCount > 0 }">
				<c:forEach var="userBook" items="${bookDto}">
					<div class="bookList">
						<a href="javascript:userBookRead('${root}', '${userBook.book_num}')">
							<img src="http://localhost:8181/gobook/css/book/images/${userBook.book_cover_file_name}" alt="준비중" width="30%" height="40%">
						</a>
						<div>
							<span>${userBook.book_name}</span>
							<span>${userBook.book_star}</span>
							<span>${userBook.book_writer}</span>
						</div>
					</div>
				</c:forEach>
			</c:if>
			
			<c:if test="${bookDtoCount==0 }">
				도서 준비중입니다.
			</c:if>
		</div>
		<div align="center" style="border:3px solid green; margin-top:450px; margin-left:430px; width:130px;">
			<c:if test="${bookDtoCount > 0}">
				<c:set var="pageBlock" value="${2}"/>
				<c:set var="pageCount" value="${bookDtoCount/boardSize+(bookDtoCount%boardSize==0 ? 0:1)}"/>
				<fmt:parseNumber var="pageCount" value="${bookDtoCount/boardSize+(bookDtoCount%boardSize==0 ? 0:1)}" integerOnly="true"/>
				<fmt:parseNumber var="result" value="${(currentPage-1)/pageBlock}" integerOnly="true"/>
				
				<c:set var="startPage" value="${result*pageBlock+1}"/>
				<c:set var="endPage" value="${startPage+pageBlock-1}"/>
			</c:if>	
			
			<!-- 마지막페이지가 출력되는 페이지보다 크면 마지막페이지를 출력되는 페이지로 바꿔줌 -->
			<c:if test="${endPage > pageCount }">		
				<c:set var="endPage" value="${pageCount}"/>
			</c:if>
			
			<c:if test="${startPage > pageBlock }">
				<a href="${root}/userBook/userBookList.do?category=${category}&pageNumber=${startPage-1}">[이전]</a>
			</c:if> 
	 			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="${root}/userBook/userBookList.do?category=${category}&pageNumber=${i}">[${i}]</a>
			</c:forEach>
			
			<c:if test="${endPage < pageCount}">
				<a href="${root}/userBook/userBookList.do?category=${category}&pageNumber=${startPage+pageBlock}">[다음]</a>
			</c:if>  
		</div>
	
</div>
 <jsp:include page="../main-bottom.jsp"/> 
	<br/><br/>	
</body>
</html>