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
<title>도서 정보 수정</title>
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
			<div align="center"><b style="font-size: 18px;">도서 정보 수정</b></div>
			<br/>
			<form class="form_style" name="bookStokUpdate" action="${root}/bookManage/bookUpdate.do" method="post" onsubmit="return bookUpdateForm(this)" enctype="multipart/form-data">	
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
					<span class="content"><input type="text" size="50" name="book_name" value="${bookDto.book_name}"/></span>
				</div>
				
				<div class="line">
					<label class="titleR">저자</label>
					<span class="content">
						<input type="text" name="book_writer" value="${bookDto.book_writer}"/>
					</span>
				</div>
				
				<div class="line">
					<label class="titleR">출판사</label>
					<span class="content">
						<input type="text" name="book_publisher" value="${bookDto.book_publisher}"/>
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
						
						<c:forTokens var="publish_date" items="${publish}" delims="/">
							<script type="text/javascript">
								
								if(bookStokUpdate.book_publish_date_year.value!="년"){
									if(bookStokUpdate.book_publish_date_month.value!="월"){
										if(bookStokUpdate.book_publish_date_day.value=="일"){
											bookStokUpdate.book_publish_date_day.value=parseInt("${publish_date}");
										}
									}
								}
								
								if(bookStokUpdate.book_publish_date_year.value!="년"){
									if(bookStokUpdate.book_publish_date_month.value=="월"){
										bookStokUpdate.book_publish_date_month.value=parseInt("${publish_date}");
									}
								}
							
								if(bookStokUpdate.book_publish_date_year.value=="년"){
									bookStokUpdate.book_publish_date_year.value="${publish_date}";
								}
							</script>
						</c:forTokens>
					</span>
				</div>
				
				<div class="line" style="height:200px;">
					<label class="titleR" style="height:180px;">줄거리</label>
					<span class="content" style="height:180px;">
						<textarea rows="10" cols="67" name="book_summary">${bookDto.book_summary}</textarea>
					</span>
				</div>
				
				<div class="line" style="height:200px;">
					<label class="titleR" style="height:180px;">목차</label>
					<span class="content" style="height:180px;">
						<textarea rows="10" cols="67" name="book_index">${bookDto.book_index}</textarea>
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
				
				<c:if test="${bookDto.book_cover_file_name !=null}">
					<div class="line" style="height: 60px;">
					<label class="titleR">도서표지</label>
					<span class="content">
						기존파일 : ${bookDto.book_cover_file_name}
						<input type="file" name="book_cover_file" />
						<input type="hidden" name="old_book_cover_file_name" value="${bookDto.book_cover_file_name}"/>
						<input type="hidden" name="old_book_cover_file_path" value="${bookDto.book_cover_file_path}"/>
						<input type="hidden" name="old_book_cover_file_size" value="${bookDto.book_cover_file_size}"/>
					</span>
				</div>
				</c:if>
				
				<c:if test="${bookDto.book_cover_file_name ==null}">
					<div class="line">
						<label class="titleR">도서표지</label>
						<span class="content">
							<input type="file" name="book_cover_file"/>
						</span>
					</div>
				</c:if>
				
				<c:if test="${bookDto.book_preview_file_name1!=null}">
					<div class="line" style="height: 60px;">
						<label class="titleR">미리보기1</label>
						<span class="content">
							기존파일 : ${bookDto.book_preview_file_name1}
							<input type="file" name="book_preview_file1"/>
						</span>
					</div>				
				</c:if>
				
				<c:if test="${bookDto.book_preview_file_name1==null}">
					<div class="line">
						<label class="titleR">미리보기1</label>
						<span class="content">
							<input type="file" name="book_preview_file1"/>
						</span>
					</div>
				</c:if>
				
				<c:if test="${bookDto.book_preview_file_name2!=null}">
					<div class="line" style="height: 60px;">
						<label class="titleR">미리보기2</label>
						<span class="content">
							기존파일 : ${bookDto.book_preview_file_name2}
							<input type="file" name="book_preview_file2"/>
						</span>
					</div>
				</c:if>
				
				<c:if test="${bookDto.book_preview_file_name2==null}">
					<div class="line">
						<label class="titleR">미리보기2</label>
						<span class="content">
							<input type="file" name="book_preview_file2"/>
						</span>
					</div>
				</c:if>
				
				<c:if test="${bookDto.book_preview_file_name3!=null}">
					<div class="line" style="height: 60px;">
						<label class="titleR">미리보기3</label>
						<span class="content">
							기존파일 : ${bookDto.book_preview_file_name3}
							<input type="file" name="book_preview_file3"/>
						</span>
					</div>
				</c:if>
				
				<c:if test="${bookDto.book_preview_file_name3==null}">
					<div class="line">
						<label class="titleR">미리보기3</label>
						<span class="content">
							<input type="file" name="book_preview_file3"/>
						</span>
					</div>
				</c:if>
				
				<div class="line" style="text-align:center;">
					<input type="submit" value="도서수정"/>
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
	
	<c:if test="${bookDto.book_cover_file_name==null}">
	<div style="margin-top:570px">
		<jsp:include page="../main-bottom.jsp"/>
	</div>
	</c:if>
	
	<c:if test="${bookDto.book_cover_file_name!=null && bookDto.book_preview_file_name1==null}">
	<div style="margin-top:620px">
		<jsp:include page="../main-bottom.jsp"/>
	</div>
	</c:if>
	
	<c:if test="${bookDto.book_cover_file_name!=null && bookDto.book_preview_file_name1!=null}">
	<div style="margin-top:710px">
		<jsp:include page="../main-bottom.jsp"/>
	</div>
	</c:if>
	
</body>
</html>