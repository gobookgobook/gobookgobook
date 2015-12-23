<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="date" value="<%=new Date() %>"/>
<fmt:formatDate var="today" value="${date}" pattern="yyyy"/>
<fmt:formatDate var="publish" value="${bookDto.book_publish_date}" type="date" pattern="yyyy/MM/dd"/>
<html>
<head>
<meta charset="UTF-8">
<title>도서 특가 설정</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/bookManage/style.css"/>
<script type="text/javascript" src="${root}/script/bookManage/script.js"></script>
<jsp:include page="../admin-top.jsp"/>
</head>
<body>
	<div id="contents" style="background:white; border:0px solid black">
	<c:if test="${id=='admin'}">
		<div style="margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
			<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;> 도서 관리</b>
		</div>
		
		<div align="left" style="width: 120px;height: 1000px;float: left;">
			<jsp:include page="bookManageConNav.jsp"/>
		</div>
			
		<div align="left" style="float: left;margin: 0 0 0 50px;width: 80%;">
			<div align="center"><b style="font-size: 18px;">도서 판매가 변경</b></div>
			<br/>
			<form class="form_style" name="bookSpecialPriceUpdate" action="${root}/bookManage/bookSpecialPriceUpdate.do" method="post" onsubmit="return bookSpecialPriceUpdateFun(this)">	
				<div style="width:598px; height:15px; border-width:2px; text-align:right; padding:15px 0px 0px 0px; border-bottom-width:0px;">
				</div>
				
				<input type="hidden" name="pageNumber" value="${pageNumber}"/>
				<input type="hidden" name="pageInfo" value="${pageInfo}"/>
				
				<div class="line">
					<label class="titleR">도서번호</label>
					<span class="content">
						<input type="hidden" name="book_num" value="${bookDto.book_num}"/>
						<input type="text" value="${bookDto.book_num}" disabled="disabled"/>
					</span>
				</div>
				
				<div class="line">
					<label class="titleR">도서명</label>
					<span class="content"><input type="text" size="50" value="${bookDto.book_name}" disabled="disabled"/></span>
				</div>
				
				<div class="line">
					<label class="titleR">재고수량</label>
					<span class="content"><input type="text" value="${bookDto.book_quantity}" disabled="disabled"/>
					</span>
				</div>
				
				<div class="line">
					<label class="titleR">도서원가</label>
					<span class="content"><input type="text" value="${bookDto.book_cost}" disabled="disabled"/></span>
				</div>
				
				<div class="line">
					<label class="titleR">도서가격</label>
					<span class="content"><input type="text" value="${bookDto.book_price}" disabled="disabled"/>
					</span>
				</div>
				
				<div class="line">
					<label class="titleR">도서특가설정</label>
					<span class="content">
						<input type="text" name="book_price" value="0"/>
					</span>
				</div>
				<br/>
				<div class="line" style="text-align:center;">
					<input type="submit" value="특가등록"/>
					<input type="button" value="이전으로" onclick="location.href='javascript:history.back()'"/>
				</div>
			</form>	
		</div>
	</c:if>
	</div>
	<c:if test="${id!='admin'}">
		<script type="text/javascript">
			alert("관리자만 접근이 가능한 페이지 입니다");
			location.href="${root}/member/goBookMain.do"
		</script>
	</c:if>
	
	<div style="margin-top: -150px">
		<jsp:include page="../main-bottom.jsp"/>
	</div>
	
</body>
</html>