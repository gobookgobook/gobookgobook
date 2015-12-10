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
<link rel="stylesheet" type="text/css" href="${root}/css/bookManage/style.css"/>
</head>
<body>
	<jsp:include page="../member/menu.jsp"/>
	<br/><br/>
	<c:if test="${id=='admin'}">
	<div id="wrap">
		<div id="header">
			<h1>GoBook!GoBook!</h1>
		</div>
		
		<div id="nav">
			<a href="${root}/bookManage/bookManage.do"><b> 도서관리 </b></a><br/>
		</div>
		
		<div id="con1" align="left" style="height:300px;">
			<a href="${root}/bookManage/bookInsert.do">도서등록</a><br/>
			<a href="${root}/bookManage/bookStockList.do">재고관리</a><br/>
			<a href="">특가설정</a><br/>
			<a href="${root}/bookManage/bookSoldOutList.do">품절도서목록</a><br/>
			<hr width="80px" align="left"/>
			<a href="">재입고신청</a><br/>
			<a href="${root}/bookManage/bookReOrderList.do">재입고현황</a><br/>
			<hr width="80px" align="left"/>
			<a href="${root}/bookManage/bookGroupPurchaseCount.do">공동구매</a><br/>
			<a href="">출간일정관리</a><br/>
		</div>
		
		<div id="con2">
			<b>도서목록</b>
			<hr/>
		<c:if test="${count==0}">
		<div align="center">
			<table class="mytable" style=" border-collapse:collapse; width: 600px; height: 18px;">
				<tr>
					<td align="center">품절된 도서가 없습니다.</td>
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
					<td class="mytable" align="center" height="18" width="80">재입고요청</td>
					<td class="mytable" align="center" height="18" width="80">공구요청</td>
				</tr>
			<c:forEach var="book" items="${bookSoldOutList}">
				<tr>
					<td class="mytable" align="center" height="18">${book.book_num}</td>
					<td class="mytable" align="left" height="18">
						<a href="${root}/bookManage/bookStockUpdate.do?book_num=${book.book_num}&pageNumber=${currentPage}"  style="margin-left: 20px;">${book.book_name}</a>
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
				<a href="${root}/bookManage/bookSoldOutList.do?pageNumber=${startPage-pageBlock}">[이전]</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${currentPage==i}">[${i}]</c:if>
				<c:if test="${currentPage!=i}">
				<a href="${root}/bookManage/bookSoldOutList.do?pageNumber=${i}">[${i}]</a>
				</c:if>
			</c:forEach>
			
			<c:if test="${endPage<pageCount}">
				<a href="${root}/bookManage/bookSoldOutList.do?pageNumber=${startPage+pageBlock}">[다음]</a>
			</c:if>
		</div>
		
		</c:if>
		</div>
	</div>
	</c:if>
	<c:if test="${id!='admin'}">
		<script type="text/javascript">
			alert("관리자만 접근이 가능한 페이지 입니다");
			location.href="${root}/member/goBookMain.do"
		</script>
	</c:if>
</body>
</html>