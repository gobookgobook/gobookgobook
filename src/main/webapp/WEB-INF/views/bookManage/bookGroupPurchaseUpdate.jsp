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
<script type="text/javascript" src="${root}/script/bookManage/script.js"></script>
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
		
		<div id=nav>
			<a href="${root}/bookManage/bookManage.do"><b> 도서관리 </b></a><br/>
		</div>
		
		<div id="con1" align="left" style="height:1200px;">
			<jsp:include page="bookManageConNav.jsp"/>
		</div>
		
		<div id="#con2" align="left">
			<b>공구 등록</b>
			<hr/>
			<form class="form_style" name="bookGroupPurchaseUpdate" action="${root}/bookManage/bookGroupPurchaseUpdate.do" method="post" onsubmit="return groupPurchaseUpdate(this)">				
				<div class="line">
					<label class="title2">공구번호</label>
					<span class="content">
						<input type="hidden" name="gp_num" value="${gpDto.gp_num}"/>
						<input type="text" value="${gpDto.gp_num}" disabled="disabled"/>
					</span>
				</div>
				
				<div class="line">
					<label class="title2">도서번호</label>
					<span class="content">
						<input type="text" value="${gpDto.book_num}" disabled="disabled"/>
					</span>
				</div>
				
				<div class="line">
					<label class="title2">도서명</label>
					<span class="content">
						<input type="text" size="50" value="${gpDto.book_name}" disabled="disabled"/>
					</span>
				</div>
				
				<div class="line">
					<label class="title2">도서원가</label>
					<span class="content">
						<input type="text" value="${gpDto.book_cost}" disabled="disabled"/>
					</span>
				</div>
				
				<div class="line">
					<label class="title2">도서가격</label>
					<span class="content">
						<input type="text" value="${gpDto.book_price}" disabled="disabled"/>
					</span>
				</div>
				
				<div class="line">
					<label class="title2">공구가격</label>
					<span class="content">
						<input type="text" name="group_purchase_price" value="${gpDto.group_purchase_price}" />
					</span>
				</div>
				
				<div class="line">
					<label class="title2">재고수량</label>
					<span class="content">
						<input type="text" value="${gpDto.book_quantity}" disabled="disabled"/>
					</span>
				</div>
				
				<div class="line">
					<label class="title2">공구 진행 최소 수량</label>
					<span class="content">
						<input type="text" name="group_purchase_min_count" value="${gpDto.group_purchase_min_count}"/>
					</span>
				</div>
				
				<div class="line">
					<label class="title2">공구 마감 최대 수량</label>
					<span class="content">
						<input type="text" name="group_purchase_max_count" value="${gpDto.group_purchase_max_count}"/>
					</span>
				</div>
				
				<div class="line">
					<label class="title2">공구 마감일</label>
					<span class="content">
						<input type="text" name="group_purchase_date" value="<fmt:formatDate value='${gpDto.group_purchase_date}' pattern='yyyy/MM/dd'/>"/>
					</span>
				</div>
				
				<div class="line" style="text-align:center;">
					<input type="submit" value="공구수정"/>
					<input type="reset" value="다시작성"/>
					<input type="button" value="공구취소" onclick="groupPurchaseDeleteFun('${root}','${gpDto.gp_num}')"/>
					<input type="button" value="목록보기" onclick="location.href='${root}/bookManage/bookGroupPurchase.do'"/>
				</div>
			</form>	
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