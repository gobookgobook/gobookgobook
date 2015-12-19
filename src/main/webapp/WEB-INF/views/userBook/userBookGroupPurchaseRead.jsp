<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/userBook/userBookRead.css"/>
<script type="text/javascript" src="${root}/script/jquery.js"></script>
<script type="text/javascript" src="${root}/script/userBook/script.js"></script>
<jsp:include page="../main-top.jsp"/>
</head>
<body>
	<br/><br/>

<div id="contents" style="height:750px; background:white; border:1px solid black"><br/><br/><br/><br/>
	<div class="book_read">
	<div class="book_top">	
		<div class="book_cover">
			<div>
			표지
			</div>
			<div>
			미리보기
			</div>
		</div>
		<div class="book_info">
			<div class="info">
				<label class="book_title">제목 : </label>
				<span class="book_content">${bookGroupPurchaseDto.book_name}</span>
			</div>
			<div class="info">
				<label class="book_title">저자 : </label>
				<span class="book_content">${bookGroupPurchaseDto.book_writer}</span>
			</div>
			<div>
				<label class="book_title">출판사 : </label>
				<span class="book_content">${bookGroupPurchaseDto.book_publisher}</span>
			</div>
			<div class="info">
				<label class="book_title">출판연도 : </label>
				<span class="book_content"><fmt:formatDate value="${bookGroupPurchaseDto.book_publish_date}" pattern="yyyy-MM-dd"/>
				</span>
			</div>
			<div class="info">
			<!-- 잘못됨 -->
				<label class="book_title">판매가 : </label>
				<span class="book_content">${bookGroupPurchaseDto.book_price}</span>
			</div>
			<div class="info">
				<label class="book_title">희망자 : </label>
				<span class="book_content" id="purchase_count">
				${bookGroupPurchaseDto.group_purchase_count}
				</span>
			</div>
			<div class="info">
				<label class="book_title">최소 수량 : </label>
				<span class="book_content">
				${bookGroupPurchaseDto.group_purchase_min_count}
				</span>
			</div>
			<div class="info">
				<label class="book_title">최대 수량 : </label>
				<span class="book_content">
				${bookGroupPurchaseDto.group_purchase_max_count}
				</span>
			</div>
			<div class="info">
				<label class="book_title">마감 기간 : </label>
				<span class="book_content">
				<fmt:formatDate value="${bookGroupPurchaseDto.group_purchase_date}" pattern="yyyy-MM-dd"/>
				</span>
			</div>
			<div>
			<c:if test="${bookGroupPurchaseDto.group_purchase_max_count > bookGroupPurchaseDto.group_purchase_count}">
				<c:if test="${id !='admin' && id !=null}">
					<input type="button" value="공동구매신청" id="groupPurchaseAsk" onclick="groupPurchaseInsert('${root}', '${bookGroupPurchaseDto.book_num}', '${bookGroupPurchaseDto.gp_num}')"/>
				</c:if>
			</c:if>
			<br/>
			<c:if test="${bookGroupPurchaseDto.group_purchase_max_count <= bookGroupPurchaseDto.group_purchase_count}">
				공구 수량이 마감되었습니다.
			</c:if>
			</div>				
		</div>
	</div>
	<div class="book_index">
	<c:if test="${bookGroupPurchaseDto.book_index !=null}">
		${bookGroupPurchaseDto.book_index}
	</c:if>
	<c:if test="${bookGroupPurchaseDto.book_index ==null}">
		목차가 존재 하지 않습니다.
	</c:if>
	</div>
	<div class="book_summary">
	<c:if test="${bookGroupPurchaseDto.book_summary !=null}">
		${bookGroupPurchaseDto.book_summary}
	</c:if>
	
	<c:if test="${bookGroupPurchaseDto.book_summary ==null}">
		줄거리가없습니다.	
	</c:if>
	</div>
	</div>
</div>
<%-- <jsp:include page="../main-bottom.jsp"/> --%>
	<br/><br/>
</body>
</html>