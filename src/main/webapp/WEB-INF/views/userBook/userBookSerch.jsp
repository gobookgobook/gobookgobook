<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script type="text/javascript" src="${root}/script/userBook/script.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link href="${root}/css/userBook/userBookList.css" rel="stylesheet" type="text/css"/>
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
<c:if test="${id!='admin'}">
	<jsp:include page="../main-top.jsp"/>
</c:if>
<c:if test="${id=='admin' }">
	<jsp:include page="../admin-top.jsp"/>
</c:if>
</head>
<body>
	<div class="container" style="width:950px; border: 0px solid black;position:static; margin-top: 20px;">
		<div class="userBookBody" style="border: 0px solid red; margin-left: 60px;">
			<c:if test="${bookSerchList.size() > 0 }">
				<c:forEach var="book" items="${bookSerchList}">
					<div class="bookList" id="nav_info">
						<div style="text-align: center;">
							<c:if test="${book.book_cover_file_name !=null }">
								<c:if test="${id!='admin'}">
									<a href="javascript:userBookRead('${root}', '${book.book_num}')">
										<img src="http://localhost:8181/gobook/images/bookImg/${book.book_cover_file_name}" alt="준비중" width="45%" height="150px;">
									</a>
								</c:if>
								<c:if test="${id=='admin'}">
									<a href="${root}/bookManage/bookRead.do?book_num=${book.book_num}"  style="margin-left: 20px;">
										<img src="http://localhost:8181/gobook/images/bookImg/${book.book_cover_file_name}" alt="준비중" width="45%" height="150px;">
									</a>
								</c:if>								
							</c:if>
							<c:if test="${book.book_cover_file_name ==null }">
								<c:if test="${id!='admin'}">
									<a href="javascript:userBookRead('${root}', '${book.book_num}')">
										<img src="http://localhost:8181/gobook/images/bookImg/a.jpg" alt="준비중" width="45%" height="50%">
									</a>
								</c:if>
								<c:if test="${id=='admin'}">
									<a href="${root}/bookManage/bookRead.do?book_num=${book.book_num}"  style="margin-left: 20px;">
										<img src="http://localhost:8181/gobook/images/bookImg/a.jpg" alt="준비중" width="45%" height="50%">
									</a>
								</c:if>	
								<img alt="" src="http://localhost:8181/gobook/images/bookImg/a.jpg" width="45%" height="70%">
							</c:if>
						</div>
						<div class="userbook_list_all" style="border: 1px dotted black;">
							<label class="userBook_title">책 제목 : </label>
							<span class="userBook_content">
							<c:choose>
								<c:when test="${fn:length(book.book_name) > 14}">
									<c:out value="${fn:substring(book.book_name, 0, 13)}"/>....
								</c:when>
								<c:otherwise>
									<c:out value="${book.book_name}"/>
								</c:otherwise>
							</c:choose>
							</span>
						</div>
						<div class="userbook_list_all">
							<label class="userBook_title">저자 : </label>
							<span class="userBook_content">${book.book_writer}</span>
						</div>
						<div class="userbook_list_all">
							<label class="userBook_title">별점 : </label>
							<span class="userBook_content">${book.book_star}</span>
						</div>
					</div>
				</c:forEach>
			</c:if>
			
			<c:if test="${bookSerchList.size() < 0 }">
				도서 준비중입니다.
			</c:if>
		</div>
		</div>
		
		<div align="center">
			<c:set var="pageBlock" value="${5}"/>
			<c:set var="pageCount" value="${count/boardSize+(count%boardSize==0 ? 0:1)}"/>		
			<fmt:parseNumber var="result" value="${(currentPage-1)/pageBlock}" integerOnly="true"/>
			<c:set var="startPage" value="${result*pageBlock+1}"/>
			<c:set var="endPage" value="${startPage+pageBlock-1}"/>
			
			<c:if test="${endPage>pageCount}">
				<c:set var="endPage" value="${pageCount}"/>
			</c:if>
			
			<c:if test="${startPage>pageBlock}">
				<a href="${root}/userBook/userBookSerch.do?pageNumber=${startPage-pageBlock}&keyword=${keyword}">[이전]</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${currentPage==i}">&nbsp;&nbsp;&nbsp;[${i}]</c:if>
				<c:if test="${currentPage!=i}">
				<a href="${root}/userBook/userBookSerch.do?pageNumber=${i}&keyword=${keyword}">[${i}]</a>
				</c:if>
			</c:forEach>
			
			<c:if test="${endPage<pageCount}">
				<a href="${root}/userBook/userBookSerch.do?pageNumber=${startPage+pageBlock}&keyword=${keyword}">[다음]</a>
			</c:if>
		</div>
<jsp:include page="../main-bottom.jsp"/>
</body>
</html>