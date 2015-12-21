<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="../main-top.jsp"/>
		<div class="container" style="width:835px;padding:0px">
			<table class="table table-bordered" style="line-height: 100px">
				<thead>
					<tr class="success" align="center" style="color:#1DDB16">
						<th style="text-align:center">도서번호</th>
						<th style="text-align:center;width:375px">도서명</th>
						<th style="text-align:center">도서가격</th>
						<th style="text-align:center">별점</th>
						<th style="text-align:center">입고요청</th>
						<th style="text-align:center">공구요청</th>
					</tr>
				</thead>
				<tbody id="listAllTd">
					<c:forEach var="book" items="${bookSerchList}">
						<tr class="success">
							<td style="text-align:center">${book.book_num}</td>
							<td style="text-align:left">
								<a href="${root}/bookManage/bookStockUpdate.do?book_num=${book.book_num}&pageNumber=${currentPage}"  style="margin-left: 20px;">${book.book_name}</a>
							</td>
							<td style="text-align:center">${book.book_price}</td>
							<td style="text-align:center">${book.book_star}</td>
							<td style="text-align:center">${book.book_reorder_count}</td>
							<td style="text-align:center">${book.book_group_purchase_count}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
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
</body>
</html>