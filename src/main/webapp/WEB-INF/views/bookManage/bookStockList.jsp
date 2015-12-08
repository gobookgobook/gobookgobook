<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
</head>
<body>
	<c:if test="${count==0}">
	<div align="center">
		<table class="mytable" style=" border-collapse:collapse; width: 600px; height: 18px;">
			<tr>
				<td align="center">등록된 도서가 없습니다.</td>
			</tr>
		</table> 
	</div>
	</c:if>
	
	<c:if test="${count>0}">
	<div align="center">
		<table class="mytable" style="border-collapse: collapse; width: 600px; height: 18px;">
			<tr>
				<td class="mytable" align="center" height="18" width="50">도서번호</td>
				<td class="mytable" align="center" height="18" width="250">도서명</td>
				<td class="mytable" align="center" height="18" width="50">도서원가</td>
				<td class="mytable" align="center" height="18" width="50">도서가격</td>
				<td class="mytable" align="center" height="18" width="50">도서수량</td>
				<td class="mytable" align="center" height="18" width="50">별점</td>
				<td class="mytable" align="center" height="18" width="50">재입고요청</td>
				<td class="mytable" align="center" height="18" width="50">공구요청</td>
			</tr>
		<c:forEach var="book" items="${bookList}">
			<tr>
				<td class="mytable" align="center" height="18">${book.book_num}</td>
				<td class="mytable" align="left" height="18">>
					<a href="${root}/bookManage/bookStockUpdate.do?book_num=${book.book_num}&pageNumber=${currentPage}">${book.book_name}</a>
				</td>
				<td class="mytable" align="center" height="18">${book.book_cost}</td>
				<td class="mytable" align="center" height="18">${book.book_price}</td>
				<td class="mytable" align="center" height="18">${book.book_quantity}</td>
				<td class="mytable" align="center" height="18">${book.book_star}</td>
				<td class="mytable" align="center" height="18">${book.book_reorder_count}</td>
				<td class="mytable" align="center" height="18">${book.book_group_purchase_count}</td>
			</tr>
		</c:forEach>
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
			<a href="${root}/fileBoard/list.do?pageNumber=${startPage-pageBlock}">[이전]</a>
		</c:if>
		
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<c:if test="${currentPage==i}">[${i}]</c:if>
			<c:if test="${currentPage!=i}">
			<a href="${root}/fileBoard/list.do?pageNumber=${i}">[${i}]</a>
			</c:if>
		</c:forEach>
		
		<c:if test="${endPage<pageCount}">
			<a href="${root}/fileBoard/list.do?pageNumber=${startPage+pageBlock}">[다음]</a>
		</c:if>
	</div>
	
	</c:if>
</body>
</html>