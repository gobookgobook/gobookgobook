<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
</head>
<body>
	<div align="center">
		<b> 도서등록 </b>
	</div>	
	<div align="center">
		<form class="form_style" action="${root}/bookManage/bookInsert.do" method="post" onsubmit="" enctype="multipart/form-data">	
			<div style="width:598px; height:15px; border-width:2px; text-align:right; padding:15px 0px 0px 0px; border-bottom-width:0px;">
				<a href="${root}/bookManage/bookStockList.do">도서목록</a>
			</div>
			
			<div class="line">
				<label class="title">도서번호</label>
				<span class="content">
					<input type="text" name="book_num"/>
				</span>
			</div>
			
			<div class="line">
				<label class="title">도서명</label>
				<span class="content"><input type="text" size="50" name="book_name"/></span>
			</div>
			
			<div class="line">
				<label class="title">저자</label>
				<span class="content">
					<input type="text" name="book_writer"/>
				</span>
			</div>
			
			<div class="line">
				<label class="title">출판사</label>
				<span class="content">
					<input type="text" name="book_publisher"/>
				</span>
			</div>
			
			<div class="line">
				<label class="title">출판일</label>
				<span class="content">
					<input type="text" name="book_publish_date"/>
				</span>
			</div>
			
			<div class="line">
				<label class="title">도서원가</label>
				<span class="content">
					<input type="text" name="book_cost"/>
				</span>
			</div>
			
			<div class="line">
				<label class="title">도서가격</label>
				<span class="content">
					<input type="text" name="book_price"/>
				</span>
			</div>
			
			<div class="line" style="height:230px;">
				<label class="title" style="height:230px;">줄거리</label>
				<span class="content" style="height:230px;">
					<textarea rows="14" cols="67" name="book_summary"></textarea>
				</span>
			</div>
			
			<div class="line" style="height:230px;">
				<label class="title" style="height:230px;">목차</label>
				<span class="content" style="height:230px;">
					<textarea rows="14" cols="67" name="book_index"></textarea>
				</span>
			</div>
			
			<div class="line">
				<label class="title">카테고리</label>
				<span class="content">
					<select name="book_category">
						<option></option>
						<option value="문학">문학</option>
						<option value="교육도서">교육도서</option>
						<option value="전공도서">전공도서</option>
						<option value="만화">만화</option>
						<option value="잡지">잡지</option>
						<option value="역사">역사</option>
						<option value="교양">교양</option>
						<option value="SF/판타지">SF/판타지</option>
					</select>
				</span>
			</div>
			
			<div class="line">
				<label class="title">입고수량</label>
				<span class="content">
					<input type="text" name="book_quantity"/>
				</span>
			</div>
			
			<div class="line">
				<label class="title">도서표지</label>
				<span class="content">
					<input type="file" name="book_cover_file"/>
				</span>
			</div>
			
			<div class="line">
				<label class="title">미리보기1</label>
				<span class="content">
					<input type="file" name="book_preview_file1"/>
				</span>
			</div>
			
			<div class="line">
				<label class="title">미리보기2</label>
				<span class="content">
					<input type="file" name="book_preview_file2"/>
				</span>
			</div>
			
			<div class="line">
				<label class="title">미리보기3</label>
				<span class="content">
					<input type="file" name="book_preview_file3"/>
				</span>
			</div>
			<div class="line" style="width:598px; border-width:2px; text-align:center;">
				<input type="submit" value="도서등록"/>
				<input type="reset" value="다시작성"/>
				<input type="button" value="목록보기" onclick="location.href='${root}/bookManage/bookStockList.do'"/>
			</div>
		</form>	
	</div>
</body>
</html>