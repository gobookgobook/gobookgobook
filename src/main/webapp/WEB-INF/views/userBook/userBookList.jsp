<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<jsp:include page="../cookie/cookie.jsp"/>
<style type="text/css">
#nav_info{
      border-bottom: 5px solid #cccccc;
      border-right: 3px solid   #cccccc;
      text-align: center;
      border-left:0px;
      border-top: 0px;
      border-radius: 0px 10px 10px 10px;
   }
</style>
</head> 	
<body>
<div id="contents" style="height:800px; background:white; border:0px solid black; position:static;">

	<div style="margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
		<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;> 도서 목록</b>
	</div>
	
	<div align="left" style="width: 120px; float:left;">
		<jsp:include page="bookCategory.jsp"/>
	</div>	
		<div class="userBookBody">
			<c:if test="${bookDtoCount > 0 }">
				<c:forEach var="userBook" items="${bookDto}">
					<div class="bookList" id="nav_info">
						<div style="text-align: center;">
							<c:if test="${userBook.book_cover_file_name !=null }">
								<a href="javascript:userBookRead('${root}', '${userBook.book_num}')">
									<img src="http://localhost:8181/gobook/images/bookImg/${userBook.book_cover_file_name}" alt="준비중" width="45%" height="70%">
								</a>
							</c:if>
							<c:if test="${userBook.book_cover_file_name ==null }">
								<img alt="" src="http://localhost:8181/gobook/images/bookImg/a.jpg" width="45%" height="70%">
							</c:if>
						</div>
						<div class="userbook_list_all">
							<label class="userBook_title">책 제목 : </label>
							<span class="userBook_content">
							<c:choose>
								<c:when test="${fn:length(userBook.book_name) > 14}">
									<c:out value="${fn:substring(userBook.book_name, 0, 13)}"/>....
								</c:when>
								<c:otherwise>
									<c:out value="${userBook.book_name}"/>
								</c:otherwise>
							</c:choose>
							</span>
						</div>
						<div class="userbook_list_all">
							<label class="userBook_title">저자 : </label>
							<span class="userBook_content">${userBook.book_writer}</span>
						</div>
						<div class="userbook_list_all">
							<label class="userBook_title">별점 : </label>
							<span class="userBook_content">${userBook.book_star}</span>
						</div>
					</div>
				</c:forEach>
			</c:if>
			
			<c:if test="${bookDtoCount==0 }">
				도서 준비중입니다.
			</c:if>
		</div>
		
		<div align="center" style="border:0px solid green; margin-top:720px; margin-left:430px; width:200px; height:20px;">
			<c:if test="${bookDtoCount > 0}">
				<c:set var="pageBlock" value="${10}"/>
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
</body>
</html>