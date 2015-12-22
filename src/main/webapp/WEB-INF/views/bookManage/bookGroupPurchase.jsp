<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../admin-top.jsp"/>
<meta charset="UTF-8">
<title>공동구매</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</head>
<body>
	<div id="contents" style="background:white; border:0px solid green">
		<c:if test="${id=='admin'}">
			<div style="margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
				<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;> 도서 관리</b>
			</div>
		
			<div align="left" style="width: 110px;float: left;">
				<jsp:include page="bookManageConNav.jsp"/>
			</div>
				
			<div align="left" style="float: left;margin: 0 0 0 50px;width: 80%;">
				<div align="center"><b style="font-size:18px">진행중인 공동구매</b></div>
				<br/>
				
				<c:if test="${gpCount==0}">
					<div class="container" style="width:835px;padding:0px">
						<table class="table table-bordered">
							<thead>
								<tr class="success" style="color:#1DDB16">
									<th style="text-align:center">공구번호</th>
									<th style="text-align:center">도서번호</th>
									<th style="text-align:center">도서명</th>
									<th style="text-align:center">도서가격</th>
									<th style="text-align:center">공구가격</th>
									<th style="text-align:center">시작수량</th>
									<th style="text-align:center">마감수량</th>
									<th style="text-align:center">공구마감일</th>
									<th style="text-align:center">공구희망자</th>
								</tr>
							</thead>
							<tbody id="listAllTd"></tbody>
						</table>
					</div>
					<div align="center"><span>공구 진행중인 도서가 없습니다.</span></div>
				</c:if>
				
				<c:if test="${gpCount>0}">
					<div class="container" style="width:835px;padding:0px">
						<table class="table table-bordered" style="line-height: 100px">
							<thead>
								<tr class="success" align="center" style="color:#1DDB16">
									<th style="text-align:center">공구번호</th>
									<th style="text-align:center">도서번호</th>
									<th style="text-align:center;width:245px">도서명</th>
									<th style="text-align:center">도서가격</th>
									<th style="text-align:center">공구가격</th>
									<th style="text-align:center">시작수량</th>
									<th style="text-align:center">마감수량</th>
									<th style="text-align:center">공구마감일</th>
									<th style="text-align:center">공구희망자</th>
								</tr>
							</thead>
							<tbody id="listAllTd">
								<c:forEach var="gpList" items="${gpList}">
									<tr class="success">
										<td style="text-align:center">${gpList.gp_num}</td>
										<td style="text-align:center">${gpList.book_num}</td>
										<td style="text-align:left">
											<a href="${root}/bookManage/bookGroupPurchaseUpdate.do?book_num=${gpList.book_num}"  style="margin-left: 20px;">
												<c:choose>
													<c:when test="${fn:length(gpList.book_name) > 21}">
														<c:out value="${fn:substring(gpList.book_name, 0, 20)}"/>....
													</c:when>
													<c:otherwise>
														${gpList.book_name}
													</c:otherwise>
												</c:choose>
											</a>
										</td>
										<td style="text-align:right">${gpList.book_price}원</td>
										<td style="text-align:right">${gpList.group_purchase_price}원</td>
										<td style="text-align:center">${gpList.group_purchase_min_count}</td>
										<td style="text-align:center">${gpList.group_purchase_max_count}</td>
										<td style="text-align:center"><fmt:formatDate value="${gpList.group_purchase_date}" pattern="yyyy/MM/dd"/></td>
										<td style="text-align:center">${gpList.group_purchase_count}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:if>
				<br/>
				
				<div>
					<br/>
					<div align="center"><b style="font-size:18px">공동구매 요청 내역</b></div>
					<br/>
					<c:if test="${count==0}">
						<div class="container" style="width:835px;padding:0px">
							<table class="table table-bordered">
								<thead>
									<tr class="success" style="color:#1DDB16">
										<th style="text-align:center">도서번호</th>
										<th style="text-align:center">도서명</th>
										<th style="text-align:center">도서가격</th>
										<th style="text-align:center">도서수량</th>
										<th style="text-align:center">별점</th>
										<th style="text-align:center">입고요청</th>
										<th style="text-align:center">공구요청</th>
									</tr>
								</thead>
								<tbody id="listAllTd"></tbody>
							</table>
						</div>
						<div align="center"><span>공동구매 요청 도서가 없습니다.</span></div>
					</c:if>
						
					<c:if test="${count>0}">
						<div class="container" style="width:835px;padding:0px">
							<table class="table table-bordered" style="line-height: 100px">
								<thead>
									<tr class="success" align="center" style="color:#1DDB16">
										<th style="text-align:center">도서번호</th>
										<th style="text-align:center;width:245px">도서명</th>
										<th style="text-align:center">도서가격</th>
										<th style="text-align:center">도서수량</th>
										<th style="text-align:center">별점</th>
										<th style="text-align:center">입고요청</th>
										<th style="text-align:center">공구요청</th>
									</tr>
								</thead>
								<tbody id="listAllTd">
									<c:forEach var="book" items="${bookGroupPurchaseCountList}">
										<tr class="success">
											<td style="text-align:center">${book.book_num}</td>
											<td style="text-align:left">
												<a href="${root}/bookManage/bookGroupPurchaseInsert.do?book_num=${book.book_num}&pageNumber=${currentPage}"  style="margin-left: 20px;">
													<c:choose>
														<c:when test="${fn:length(book.book_name) > 21}">
															<c:out value="${fn:substring(book.book_name, 0, 20)}"/>....
														</c:when>
														<c:otherwise>
															${book.book_name}
														</c:otherwise>
													</c:choose>
												</a>
											</td>
											<td style="text-align:right">${book.book_price}원</td>
											<td style="text-align:center">${book.book_quantity}</td>
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
								<a href="${root}/bookManage/bookGroupPurchase.do?pageNumber=${startPage-pageBlock}">[이전]</a>
							</c:if>
							
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${currentPage==i}">&nbsp;&nbsp;&nbsp;[${i}]</c:if>
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
		</c:if>
	</div>
	
	<c:if test="${id!='admin'}">
		<script type="text/javascript">
			alert("관리자만 접근이 가능한 페이지 입니다");
			location.href="${root}/member/goBookMain.do"
		</script>
	</c:if>
	
<%-- 	<div style="display: block">
		<jsp:include page="../main-bottom.jsp"/>
	</div> --%>
	
 	<c:if test="${gpCount==0}">
		<div style="margin-top: 200px">
			<jsp:include page="../main-bottom.jsp"/>
		</div>
	</c:if>
	
	<c:if test="${gpCount>0 && gpCount<=3}">
		<div style="margin-top: 350px">
			<jsp:include page="../main-bottom.jsp"/>
		</div>
	</c:if>
	
	<c:if test="${gpCount>3 && gpCount<=6}">
		<div style="margin-top: 500px">
			<jsp:include page="../main-bottom.jsp"/>
		</div>
	</c:if>
	
	<c:if test="${gpCount>6 && gpCount<=9}">
		<div style="margin-top: 650px">
			<jsp:include page="../main-bottom.jsp"/>
		</div>
	</c:if>
</body>
</html>