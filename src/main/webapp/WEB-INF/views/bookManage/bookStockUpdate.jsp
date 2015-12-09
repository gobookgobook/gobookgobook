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
	<div id="wrap">
		<div id="header">
			<h1>GoBook!GoBook!</h1>
		</div>
		
		<div id=nav>
			<a href="${root}/bookManage/bookManage.do"><b> 도서관리 </b></a><br/>
		</div>
		
		<div id="con1" align="left" style="height:1200px;">
			<a href="${root}/bookManage/bookInsert.do">도서등록</a><br/>
			<a href="${root}/bookManage/bookStockList.do">도서목록</a><br/>
			<a href="">재고관리</a><br/>
			<a href="">특가설정</a><br/>
			<a href="${root}/bookManage/bookSoldOutList.do">품절도서목록</a><br/>
			<hr width="80px" align="left"/>
			<a href="">재입고신청</a><br/>
			<a href="${root}/bookManage/bookReOrderList.do">재입고현황</a><br/>
			<hr width="80px" align="left"/>
			<a href="">공동구매</a><br/>
			<a href="">출간일정관리</a><br/>
		</div>
		
		<div id="#con2" align="left">
			<b>도서수정 </b>
			<hr/>
			<form class="form_style" name="bookStokUpdate" action="${root}/bookManage/bookStockUpdate.do" method="post" onsubmit="return bookUpdateForm(this)" enctype="multipart/form-data">	
				<div style="width:598px; height:15px; border-width:2px; text-align:right; padding:15px 0px 0px 0px; border-bottom-width:0px;">
					<a href="${root}/bookManage/bookStockList.do">도서목록</a>
				</div>
				
				<input type="hidden" name="pageNumber" value="${pageNumber}"/>
				
				<div class="line">
					<label class="title">도서번호</label>
					<span class="content">
						<input type="hidden" name="book_num" value="${bookDto.book_num}"/>
						<input type="text" value="${bookDto.book_num}" disabled="disabled"/>
					</span>
				</div>
				
				<div class="line">
					<label class="title">도서명</label>
					<span class="content"><input type="text" size="50" name="book_name" value="${bookDto.book_name}"/></span>
				</div>
				
				<div class="line">
					<label class="title">저자</label>
					<span class="content">
						<input type="text" name="book_writer" value="${bookDto.book_writer}"/>
					</span>
				</div>
				
				<div class="line">
					<label class="title">출판사</label>
					<span class="content">
						<input type="text" name="book_publisher" value="${bookDto.book_publisher}"/>
					</span>
				</div>
				
				<div class="line">
					<label class="title">출판일</label>
					<span class="content">	
						<input type="text" name="book_publish_date" value="<fmt:formatDate value="${bookDto.book_publish_date}" pattern="yyyy/MM/dd"/>"/>
					</span>
				</div>
				
				<div class="line">
					<label class="title">도서원가</label>
					<span class="content">
						<input type="text" name="book_cost" value="${bookDto.book_cost}"/>
					</span>
				</div>
				
				<div class="line">
					<label class="title">도서가격</label>
					<span class="content">
						<input type="text" name="book_price" value="${bookDto.book_price}"/>
					</span>
				</div>
				
				<div class="line" style="height:200px;">
					<label class="title" style="height:180px;">줄거리</label>
					<span class="content" style="height:180px;">
						<textarea rows="10" cols="67" name="book_summary">${bookDto.book_summary}</textarea>
					</span>
				</div>
				
				<div class="line" style="height:200px;">
					<label class="title" style="height:180px;">목차</label>
					<span class="content" style="height:180px;">
						<textarea rows="10" cols="67" name="book_index">${bookDto.book_index}</textarea>
					</span>
				</div>
				
				<div class="line" style="height:160px;">
					<label class="title" style="height:160px;">카테고리</label>
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
						<c:forTokens var="categorychk" items="${bookDto.book_category}" delims=",">
							<script type="text/javascript">
								for(var i=0;i<bookStokUpdate.category.length;i++){
									if(bookStokUpdate.category[i].value=="${categorychk}"){
										bookStokUpdate.category[i].checked=true;
									}
								}
							</script>
						</c:forTokens>
					</span>
				</div>
				
				<div class="line">
					<label class="title">재고수량</label>
					<span class="content">
						<input type="hidden" name="book_quantity" value="${bookDto.book_quantity}"/>
						<input type="text" value="${bookDto.book_quantity}" disabled="disabled"/>
					</span>
				</div>
				
				<div class="line">
					<label class="title">입고요청수량</label>
					<span class="content">
						<input type="text" name="reorder_quantity" value="0"/>
					</span>
				</div>
				
				<div class="line">
					<label class="title">도서표지</label>
					<span class="content">
						<input type="file" name="${book_cover_file}"/>
					</span>
				</div>
				
				<div class="line">
					<label class="title">미리보기1</label>
					<span class="content">
						<input type="file" name="${book_preview_file1}"/>
					</span>
				</div>
				
				<div class="line">
					<label class="title">미리보기2</label>
					<span class="content">
						<input type="file" name="${book_preview_file2}"/>
					</span>
				</div>
				
				<div class="line">
					<label class="title">미리보기3</label>
					<span class="content">
						<input type="file" name="${book_preview_file3}"/>
					</span>
				</div>
				
				<div class="line" style="text-align:center;">
					<input type="submit" value="도서수정"/>
					<input type="reset" value="다시작성"/>
					<input type="button" value="공구등록" onclick="location.href='${root}/bookManage/bookManage.do'"/>
					<input type="button" value="목록보기" onclick="location.href='${root}/bookManage/bookStockList.do'"/>
				</div>
			</form>	
		</div>
	</div>
</body>
</html>