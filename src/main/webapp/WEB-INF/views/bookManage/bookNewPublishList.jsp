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
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/bookManage/style.css"/>
<jsp:include page="../admin-top.jsp"/>
</head>
<body>
	<c:set var="id" value="admin" scope="session"/>
	<div id="contents" style="background:white; border:0px solid black">
	<c:if test="${id=='admin'}">
		<div style="background-color: #41AF39;margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
			<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;도서 관리</b>
		</div>
		
		<div align="left" style="width: 120px;float: left;">
			<jsp:include page="bookManageConNav.jsp"/>
		</div>
			
		<div align="left" style="float: left;margin: 20px 0 0 50px;width: 80%;">
			<div align="center"><b style="font-size: 16px;">신간 도서 구매 희망 내역</b></div>
			<br/>
		<c:if test="${count==0}">
		<div align="center">
			<table class="mytable" style=" border-collapse:collapse; width: 600px; height: 18px;">
				<tr>
					<td align="center">신간 도서 구매 희망 내역이 없습니다.</td>
				</tr>
			</table> 
		</div>
		</c:if>
		
		<c:if test="${count>0}">
		<div align="center">
			<table class="mytable" style="border-collapse: collapse; width: 800px; height: 18px;">
				<tr>
					<td class="mytable" align="center" height="18" width="80">도서번호</td>
					<td class="mytable" align="center" height="18" width="240">도서명</td>
					<td class="mytable" align="center" height="18" width="80">도서원가</td>
					<td class="mytable" align="center" height="18" width="80">도서가격</td>
					<td class="mytable" align="center" height="18" width="80">도서수량</td>
					<td class="mytable" align="center" height="18" width="80">별점</td>
					<td class="mytable" align="center" height="18" width="80">신간요청</td>
					<td class="mytable" align="center" height="18" width="80">공구요청</td>
				</tr>
			<c:forEach var="newBook" items="${bookNewPublishList}">
				<tr>
					<td class="mytable" align="center" height="18">${newBook.book_num}</td>
					<td class="mytable" align="left" height="18">
						<a href="${root}/bookManage/bookStockUpdate.do?book_num=${newBook.book_num}&pageNumber=${currentPage}"  style="margin-left: 20px;">${newBook.book_name}</a>
					</td>
					<td class="mytable" align="center" height="18">${newBook.book_cost}</td>
					<td class="mytable" align="center" height="18">${newBook.book_price}</td>
					<td class="mytable" align="center" height="18">${newBook.book_quantity}</td>
					<td class="mytable" align="center" height="18">${newBook.book_star}</td>
					<td class="mytable" align="center" height="18">${newBook.book_reorder_count}</td>
					<td class="mytable" align="center" height="18">${newBook.book_group_purchase_count}</td>
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
				<a href="${root}/bookManage/bookReOrderCount.do?pageNumber=${startPage-pageBlock}">[이전]</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${currentPage==i}">[${i}]</c:if>
				<c:if test="${currentPage!=i}">
				<a href="${root}/bookManage/bookReOrderCount.do?pageNumber=${i}">[${i}]</a>
				</c:if>
			</c:forEach>
			
			<c:if test="${endPage<pageCount}">
				<a href="${root}/bookManage/bookReOrderCount.do?pageNumber=${startPage+pageBlock}">[다음]</a>
			</c:if>
		</div>
		
		</c:if>
		</div>
	</c:if>
	</div>
	<c:if test="${id!='admin'}">
		<script type="text/javascript">
			alert("관리자만 접근이 가능한 페이지 입니다");
			location.href="${root}/member/goBookMain.do"
		</script>
	</c:if>
</body>
</html>