<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="date" value="<%=new Date() %>"/>
<fmt:formatDate var="today" value="${date}" pattern="yyyy"/>
<fmt:formatDate var="group_purchase" value="${gpDto.group_purchase_date}" type="date" pattern="yyyy/MM/dd"/>
<html>
<head>
<meta charset="UTF-8">
<title>공구 수정</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script type="text/javascript" src="${root}/script/bookManage/script.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/bookManage/style.css"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<jsp:include page="../admin-top.jsp"/>
</head>
<body>
	<div id="contents" style="background:white; border:0px solid black;margin-bottom: 150px">
	<c:if test="${id=='admin'}">
		<div style="margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
			<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;> 도서 관리</b>
		</div>
		
		<div align="left" style="width: 120px;float: left;">
			<jsp:include page="bookManageConNav.jsp"/>
		</div>
			
		<div align="left" style="float: left;margin: 0 0 0 50px;width: 80%;">
			<div align="center"><b style="font-size: 18px;">공동 구매 수정</b></div>
			<br/>
			<form class="form_style" name="bookGroupPurchaseUpdate" action="${root}/bookManage/bookGroupPurchaseUpdate.do" method="post" onsubmit="return groupPurchaseForm(this)">				
				<div class="line">
					<label class="titleR">공구번호</label>
					<span class="content">
						<input type="hidden" name="gp_num" value="${gpDto.gp_num}"/>
						<input type="text" value="${gpDto.gp_num}" disabled="disabled"/>
					</span>
				</div>
				
				<div class="line">
					<label class="titleR">도서번호</label>
					<span class="content">
						<input type="text" value="${gpDto.book_num}" disabled="disabled"/>
					</span>
				</div>
				
				<div class="line">
					<label class="titleR">도서명</label>
					<span class="content">
						<input type="text" size="50" value="${gpDto.book_name}" disabled="disabled"/>
					</span>
				</div>
				
				<div class="line">
					<label class="titleR">도서원가</label>
					<span class="content">
						<input type="text" value="${gpDto.book_cost}" disabled="disabled"/>
					</span>
				</div>
				
				<div class="line">
					<label class="titleR">도서가격</label>
					<span class="content">
						<input type="text" value="${gpDto.book_price}" disabled="disabled"/>
					</span>
				</div>
				
				<div class="line">
					<label class="titleR">공구가격</label>
					<span class="content">
						<input type="text" name="group_purchase_price" value="${gpDto.group_purchase_price}" />
					</span>
				</div>
				
				<div class="line">
					<label class="titleR">재고수량</label>
					<span class="content">
						<input type="text" value="${gpDto.book_quantity}" disabled="disabled"/>
					</span>
				</div>
				
				<div class="line">
					<label class="titleR">공구 진행 수량</label>
					<span class="content">
						<input type="text" name="group_purchase_min_count" value="${gpDto.group_purchase_min_count}"/>
					</span>
				</div>
				
				<div class="line">
					<label class="titleR">공구 마감 수량</label>
					<span class="content">
						<input type="text" name="group_purchase_max_count" value="${gpDto.group_purchase_max_count}"/>
					</span>
				</div>
				
				<div class="line">
					<label class="titleR">공구 마감일</label>
					<span class="content">
						<select name="group_purchase_date_year">
	    					<option>년</option>
							<c:forEach var="year" begin="1900" end="${today+1}">
							<option value="${year}">${year}</option>
							</c:forEach>
						</select>
						
						<select name="group_purchase_date_month">
							<option>월</option>
							<c:forEach var="month" begin="1" end="12">
							<option value="${month}">${month}</option>
							</c:forEach>
						</select>
						
						<select name="group_purchase_date_day">
							<option>일</option>
							<c:forEach var="day" begin="1" end="31">
							<option value="${day}">${day}</option>
							</c:forEach>
						</select>
						
						<input type="hidden" name="group_purchase_date"/>
						
						<c:forTokens var="gp_date" items="${group_purchase}" delims="/">
							<script type="text/javascript">
								
								if(bookGroupPurchaseUpdate.group_purchase_date_year.value!="년"){
									if(bookGroupPurchaseUpdate.group_purchase_date_month.value!="월"){
										if(bookGroupPurchaseUpdate.group_purchase_date_day.value=="일"){
											bookGroupPurchaseUpdate.group_purchase_date_day.value="${gp_date}";
										}
									}
								}
								
								if(bookGroupPurchaseUpdate.group_purchase_date_year.value!="년"){
									if(bookGroupPurchaseUpdate.group_purchase_date_month.value=="월"){
										bookGroupPurchaseUpdate.group_purchase_date_month.value=parseInt("${gp_date}");
									}
								}
							
								if(bookGroupPurchaseUpdate.group_purchase_date_year.value=="년"){
									bookGroupPurchaseUpdate.group_purchase_date_year.value="${gp_date}";
								}
							</script>
						</c:forTokens>
					</span>
				</div>
				
				<div class="line" style="text-align:center;">
					<input type="submit" value="공구수정"/>
					<input type="reset" value="다시작성"/>
					<input type="button" value="공구취소" onclick="groupPurchaseDeleteFun('${root}','${gpDto.gp_num}','${gpDto.book_num}')"/>
					<input type="button" value="목록보기" onclick="location.href='${root}/bookManage/bookGroupPurchase.do'"/>
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
	
	<div style="margin-top: -70px">
		<jsp:include page="../main-bottom.jsp"/>
	</div>
</body>
</html>