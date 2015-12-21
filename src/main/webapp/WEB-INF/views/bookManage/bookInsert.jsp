<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="date" value="<%=new Date() %>"/>
<fmt:formatDate var="today" value="${date}" pattern="yyyy"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/bookManage/style.css"/>
<script type="text/javascript" src="${root}/script/bookManage/script.js"></script>
<jsp:include page="../admin-top.jsp"/>
</head>
<body>
	<c:set var="id" value="admin" scope="session"/>
	<div id="contents" style="background:white; border:0px solid black">
	<c:if test="${id=='admin'}">
		<div style="margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
			<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;> 도서 등록</b>
		</div>
		
		<div align="left" style="width: 110px;float: left;">
			<jsp:include page="bookManageConNav.jsp"/>
		</div>
			
		<div align="left" style="float: left;margin: 20px 0 0 50px;width: 80%;">
			<form class="form_style" action="${root}/bookManage/bookInsert.do" method="post" onsubmit="return bookDataForm(this)" enctype="multipart/form-data">
				<br/><br/>
				<div align="center"><b style="font-size: 18px;">도서등록</b></div>
				<br/>
				
				<input type="hidden" name="pageNumber" value="${pageNumber}"/>
				<div class="line">
					<label class="titleR">도서번호</label>
					<span class="content">
						<input type="text" name="book_num"/>
					</span>
				</div>
				
				<div class="line">
					<label class="titleR">도서명</label>
					<span class="content"><input type="text" size="50" name="book_name"/></span>
				</div>
				
				<div class="line">
					<label class="titleR">저자</label>
					<span class="content">
						<input type="text" name="book_writer"/>
					</span>
				</div>
				
				<div class="line">
					<label class="titleR">출판사</label>
					<span class="content">
						<input type="text" name="book_publisher"/>
					</span>
				</div>
				
				<div class="line">
					<label class="titleR">출판일</label>
					<span class="content">
					
						<select name="book_publish_date_year">
	    					<option>년</option>
							<c:forEach var="year" begin="1900" end="${today+1}">
							<option value="${year}">${year}</option>
							</c:forEach>
						</select>
						
						<select name="book_publish_date_month">
							<option>월</option>
							<c:forEach var="month" begin="1" end="12">
							<option value="${month}">${month}</option>
							</c:forEach>
						</select>
						
						<select name="book_publish_date_day">
							<option>일</option>
							<c:forEach var="day" begin="1" end="31">
							<option value="${day}">${day}</option>
							</c:forEach>
						</select>
						
						<input type="hidden" name="book_publish_date"/>
					</span>
				</div>
				
				<div class="line">
					<label class="titleR">도서원가</label>
					<span class="content">
						<input type="text" name="book_cost"/>
					</span>
				</div>
				
				<div class="line">
					<label class="titleR">도서가격</label>
					<span class="content">
						<input type="text" name="book_price"/>
					</span>
				</div>
				
				<div class="line" style="height:200px;">
					<label class="titleR" style="height:180px;">줄거리</label>
					<span class="content" style="height:180px;">
						<textarea rows="10" cols="67" name="book_summary"></textarea>
					</span>
				</div>
				
				<div class="line" style="height:200px;">
					<label class="titleR" style="height:180px;">목차</label>
					<span class="content" style="height:180px;">
						<textarea rows="10" cols="67" name="book_index"></textarea>
					</span>
				</div>
				
				<div class="line" style="height:160px;">
					<label class="titleR" style="height:160px;">카테고리</label>
					<span class="content" style="height:160px;">
						<input type="checkbox" name="category" value="문학"/> 문학<br/>
						<input type="checkbox" name="category" value="교육도서"/> 교육도서 <br/>
						<input type="checkbox" name="category" value="전공도서"/> 전공도서 <br/>
						<input type="checkbox" name="category" value="만화"/> 만화 <br/>
						<input type="checkbox" name="category" value="잡지"/> 잡지 <br/>
						<input type="checkbox" name="category" value="역사"/> 역사 <br/>
						<input type="checkbox" name="category" value="교양"/> 교양 <br/>
						<input type="checkbox" name="category" value="SF/판타지"/> SF/판타지 <br/>
						<input type="hidden" name="book_category"/>
					</span>
				</div>
				
				<div class="line">
					<label class="titleR">입고수량</label>
					<span class="content">
						<input type="text" name="book_quantity" value="0"/>
					</span>
				</div>
				
				<div class="line">
					<label class="titleR">도서표지</label>
					<span class="content">
						<input type="file" name="book_cover_file"/>
					</span>
				</div>
				
				<div class="line">
					<label class="titleR">미리보기1</label>
					<span class="content">
						<input type="file" name="book_preview_file1"/>
					</span>
				</div>
				
				<div class="line">
					<label class="titleR">미리보기2</label>
					<span class="content">
						<input type="file" name="book_preview_file2"/>
					</span>
				</div>
				
				<div class="line">
					<label class="titleR">미리보기3</label>
					<span class="content">
						<input type="file" name="book_preview_file3"/>
					</span>
				</div>
				<div class="line" style="text-align:center;">
					<input type="submit" value="도서등록"/>
					<input type="reset" value="다시작성"/>
					<input type="button" value="목록보기" onclick="location.href='${root}/bookManage/bookStockList.do'"/>
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
	
	<div style="margin-top:700px">
		<jsp:include page="../main-bottom.jsp"/>
	</div>
</body>
</html>