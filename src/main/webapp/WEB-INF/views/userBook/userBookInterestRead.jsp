<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<jsp:include page="../main-top.jsp"/>
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
<link rel="stylesheet" type="text/css" href="${root}/css/userBook/userBookInterest.css"/>
<script type="text/javascript" src="${root}/script/userBook/script.js"></script>
<body>
<div id="contents" style="height:800px; background:white; border:1px solid black">
	<div style="margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
			<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;관심분야 추천 목록</b>
	</div>
	<div class="interestAll">
		<div class="interestBody">
			<c:if test="${id !=null }">
				<c:if test="${book.size() >0}">
						<h2 align="center">관심분야 추천</h2>
					<c:forEach var="interestBook" items="${book}">
						<div class="interest" id="nav_info">
							<div style="width: 100%; height: 83%;" align="center">
	 								<a href="javascript:userBookRead('${root}', '${interestBook.book_num}')">
									<c:if test="${interestBook.book_cover_file_name !=null}">	
										<img alt="" src="http://localhost:8181/gobook/images/bookImg/${interestBook.book_cover_file_name}" width="55%" height="80%">
									</c:if>
									<c:if test="${interestBook.book_cover_file_name ==null}">
										<img alt="" src="http://localhost:8181/gobook/images/bookImg/a.jpg" width="55%" height="80%">
									</c:if>
								</a>
							</div>
							<div style="width: 100%; height: 15%; text-align: center;">
								${interestBook.book_name}
							</div>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${book.size()==0}">
					<h2 align="center">베스트 셀러 추천</h2>
					<c:forEach var="interestBook" items="${bestList}">
						<div class="interest">
							<div style="width: 100%; height: 83%;" align="center">
								<a href="javascript:userBookRead('${root}', '${interestBook.book_num}')">
									<img src="http://localhost:8181/gobook/images/bookImg/${interestBook.book_cover_file_name}" width="60%" height="90%" style="margin-top: 5px;"/>
								</a>
							</div>
							<div style="width: 100%; height: 15%; text-align: center;">
								${interestBook.book_name}
							</div>
						</div>
					</c:forEach>
				</c:if>
			</c:if>
			
			<c:if test="${id ==null }">
				<div align="center" style="padding-bottom:25px; ">확인하세요!<br/> 현재 고객님의 장바구니에 담긴 도서가 없습니다!</div>
			</c:if>
		</div>
	</div>
</div>
<jsp:include page="../main-bottom.jsp"/>
</body>
</html>