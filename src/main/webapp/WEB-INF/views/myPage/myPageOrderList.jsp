<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/myPage/orderList.css"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<jsp:include page="../main-top.jsp"/>
</head>
<body>
<div id="contents" style="height:400px; background:white; border:0px solid black; position:static;"><br/><br/><br/><br/>	
	<c:if test="${id==null}">
	
		<h3 align="center">회원가입 혹은 로그인을 해주세여</h3>
		<div align="center">
			<a href="${root}/member/register.do">회원가입</a> <a href="${root}/member/login.do">로그인</a>
		</div>
	</c:if>
	
	<c:if test="${id != null && id!='admin'}">
	<div style="background-color: #6799FF;margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
			<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;마이페이지</b>
	</div>
	<div align="left" style="width: 120px; float:left;">
		<jsp:include page="category.jsp"/>
			<div class="container" style="width:600px;  border:0px solid red; margin-left:200px; margin-top:-250px;">
		<div class="myPageHistoryListSelect">
			<table class="table table-bordered">
						<thead>
							<tr class="info" align="center" style="color:#1770b5">
								<th>주문번호</th>					
								<th>주문일자</th>
								<th>주문내역</th>
								<th>주문상태</th>
								
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
			
			<c:if test="${count >0 }">
				<c:forEach var="userOrder" items="${userOrderlist}">
					<div class="orderbody">
						<div class="order_bunho">${userOrder.order_bunho}</div>
						<div class="order_date"><fmt:formatDate value="${userOrder.order_date}" pattern="yyyy-MM-dd"/>
						</div>
						<div class="order_book_name">${userOrder.order_book_name}</div>
					<c:if test="${userOrder.order_book_state == 12}"> 
						<div class="order_book_state">
						배송완료
						</div>
					</c:if> 
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${count==0 }">
			<div class="orderbody" style="text-align: center;">
				 최근 주문내역이 없습니다.
			</div>
			</c:if>
				<div align="center">
					<c:if test="${count > 0}">
						<c:set var="pageBlock" value="${2}"/>
						<c:set var="pageCount" value="${count/boardSize+(count%boardSize==0 ? 0:1)}"/>
						<fmt:parseNumber var="pageCount" value="${count/boardSize+(count%boardSize==0 ? 0:1)}" integerOnly="true"/>
						<fmt:parseNumber var="result" value="${(currentPage-1)/pageBlock}" integerOnly="true"/>
						
						<c:set var="startPage" value="${result*pageBlock+1}"/>
						<c:set var="endPage" value="${startPage+pageBlock-1}"/>
					</c:if>	
					
					<!-- 마지막페이지가 출력되는 페이지보다 크면 마지막페이지를 출력되는 페이지로 바꿔줌 -->
					<c:if test="${endPage > pageCount }">		
						<c:set var="endPage" value="${pageCount}"/>
					</c:if>
					
					<c:if test="${startPage > pageBlock }">
						<a href="${root}/myPage/myPageOrderList.do?pageNumber=${startPage-1}">[이전]</a>
					</c:if> 
			 			
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<a href="${root}/myPage/myPageOrderList.do?pageNumber=${i}">[${i}]</a>
					</c:forEach>
					
					<c:if test="${endPage < pageCount}">
						<a href="${root}/myPage/myPageOrderList.do?pageNumber=${startPage+pageBlock}">[다음]</a>
					</c:if>  
				</div>
			</div>	
		</div>	
</div> 
</c:if>
</div>
 <jsp:include page="../main-bottom.jsp"/> 
	<br/><br/>		
</body>
</html>