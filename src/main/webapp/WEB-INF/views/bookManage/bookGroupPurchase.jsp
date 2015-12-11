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
			<jsp:include page="bookManageConNav.jsp"/>
		</div>
		
		<div id="con2">
			<div>
				<b>진행중인 공동구매</b>
				<hr/>
			<c:if test="${gpCount==0}">
			<div align="center">
				<table class="mytable" style=" border-collapse:collapse; width: 600px; height: 18px;">
					<tr>
						<td align="center">진행중인 공동구매가 없습니다.</td>
					</tr>
				</table> 
			</div>
			</c:if>
			
			<c:if test="${gpCount>0}">
			<div align="center">
				<table class="mytable" style="border-collapse: collapse; width: 800px; height: 18px;">
					<tr>
						<td class="mytable" align="center" height="18" width="70">공구번호</td>
						<td class="mytable" align="center" height="18" width="70">도서번호</td>
						<td class="mytable" align="center" height="18" width="240">도서명</td>
						<td class="mytable" align="center" height="18" width="70">도서가격</td>
						<td class="mytable" align="center" height="18" width="70">공구가격</td>
						<td class="mytable" align="center" height="18" width="70">시작수량</td>
						<td class="mytable" align="center" height="18" width="70">마감수량</td>
						<td class="mytable" align="center" height="18" width="70">공구마감일</td>
						<td class="mytable" align="center" height="18" width="70">공구희망자</td>
					</tr>
				<c:forEach var="gpList" items="${gpList}">
					<tr>
						<td class="mytable" align="center" height="18">${gpList.gp_num}</td>
						<td class="mytable" align="center" height="18">${gpList.book_num}</td>
						<td class="mytable" align="left" height="18">
							<a href="${root}/bookManage/bookGroupPurchaseUpdate.do?book_num=${gpList.book_num}" style="margin-left: 20px;">${gpList.book_name}</a>
						</td>
						<td class="mytable" align="center" height="18">${gpList.book_price}</td>
						<td class="mytable" align="center" height="18">${gpList.group_purchase_price}</td>
						<td class="mytable" align="center" height="18">${gpList.group_purchase_min_count}</td>
						<td class="mytable" align="center" height="18">${gpList.group_purchase_max_count}</td>
						<td class="mytable" align="center" height="18"><fmt:formatDate value="${gpList.group_purchase_date}" pattern="yyyy/MM/dd"/></td>
						<td class="mytable" align="center" height="18">${gpList.group_purchase_count}</td>
					</tr>
				</c:forEach>
				</table> 
			</div>
			</c:if>
			</div>
			<br/>
			<div>
				<b>공동구매 요청 내역</b>
				<hr/>
			<c:if test="${count==0}">
			<div align="center">
				<table class="mytable" style=" border-collapse:collapse; width: 600px; height: 18px;">
					<tr>
						<td align="center">공동구매 요청 도서가 없습니다.</td>
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
				<c:forEach var="book" items="${bookGroupPurchaseCountList}">
					<tr>
						<td class="mytable" align="center" height="18">${book.book_num}</td>
						<td class="mytable" align="left" height="18">
							<a href="${root}/bookManage/bookGroupPurchaseInsert.do?book_num=${book.book_num}&pageNumber=${currentPage}"  style="margin-left: 20px;">${book.book_name}</a>
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
					<a href="${root}/bookManage/bookGroupPurchase.do?pageNumber=${startPage-pageBlock}">[이전]</a>
				</c:if>
				
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${currentPage==i}">[${i}]</c:if>
					<c:if test="${currentPage!=i}">
					<a href="${root}/bookManage/bookGroupPurchase.do?pageNumber=${i}">[${i}]</a>
					</c:if>
				</c:forEach>
				
				<c:if test="${endPage<pageCount}">
					<a href="${root}/bookManage/bookGroupPurchase.do?pageNumber=${startPage+pageBlock}">[다음]</a>
				</c:if>
			</div>
			
			</c:if>
			</div>
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