<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<jsp:include page="../main-top.jsp"/>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/userBook/userBookRead.css"/>
<script type="text/javascript" src="${root}/script/jquery.js"></script>
<script type="text/javascript" src="${root}/script/bookManage/script.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="${root}/script/star/jquery.raty.js"></script>
<style type="text/css">
#nav_info{
      border-bottom: 5px solid #cccccc;
      border-right: 3px solid   #cccccc;
      text-align: center;
      border-left:0px;
      border-top: 0px;
      border-radius: 0px 10px 10px 10px;
   }
</style>
</head>
<body>
<div id="contents" style="height:840px; background:white; border:0px solid black">
		<br/>
		<div align="center"><b style="font-size:18px">도서 상세 보기</b></div>
		<br/>
	<div class="book_read">
		<div class="book_top">	
			<div class="book_cover" id="nav_info">
				<div align="center">
					<c:if test="${bookDto.book_cover_file_name !=null}">	
						<img alt="" src="http://localhost:8181/gobook/images/bookImg/${bookDto.book_cover_file_name}" width="55%" height="60%">
					</c:if>
					<c:if test="${bookDto.book_cover_file_name ==null}">
						<img alt="" src="http://localhost:8181/gobook/images/bookImg/a.jpg" width="33%" height="45%">
					</c:if>
				</div>
				<div align="center" style="margin-top: 5px;">
					<c:if test="${bookDto.book_preview_file_name1 !=null }">
						<input type="button" onclick="javascript:preview('${root}', '${bookDto.book_num}')" value="미리보기" style="width:70px; height:23px;">
					</c:if>
					<c:if test="${bookDto.book_preview_file_name1 ==null }">
						<label>미리보기가 없습니다.</label>
					</c:if>
				</div>
				<div align="center" style="margin-top: 10px;">
					<div id="star"></div>
			        <div style="padding-top:1px;">
			            <label>별점 : </label><span id="displayStarRating" style="padding-left:20px;">${bookDto.book_star}</span>
			        </div>
				</div>
			</div>
			<div class="book_info" id="nav_info">
				<table class="table table-bordered" style="width:860px; border-spacing:13px;">
					<tbody>
						<tr>
							<td style="background:#37415a; color: white; padding: 7px;" width="20%">제목 : </td>
							<td>
							${bookDto.book_name}								
							</td>
						</tr>
						<tr>
							<td style="background:#37415a; color: white; padding: 7px;">저자 : </td>
							<td>
							${bookDto.book_writer}							
							</td>
						</tr>
						<tr>
							<td style="background:#37415a; color: white; padding: 7px;">출판사 : </td>
							<td>
							${bookDto.book_publisher}							
							</td>
						</tr>						
						<tr>
							<td style="background:#37415a; color: white; padding: 7px;">출판연도 : </td>
							<td>
							<fmt:formatDate value="${bookDto.book_publish_date}" pattern="yyyy-MM-dd"/>							
							</td>
						</tr>
						<tr>
							<td style="background:#37415a; color: white; padding: 7px;">판매가 : </td>
							<td>
							${bookDto.book_price}						
							</td>
						</tr>
						<tr>
							<td style="background:#37415a; color: white; padding: 7px;">수량  : </td>
							
							<c:if test="${bookDto.book_quantity>0}">
								<td>${bookDto.book_quantity}</td>
							</c:if>
							<c:if test="${bookDto.book_quantity==0}">
								<td>품절/${bookDto.book_quantity}</td>
							</c:if>		
						</tr>
					</tbody>
    			</table>
				<div style="margin-left: 10px;">
					<input style="width:90px; height:23px;" type="button" value="도서 정보 수정" onclick="location.href='${root}/bookManage/bookStockUpdate.do?book_num=${bookDto.book_num}'"/>
					<c:if test="${bookDto.book_quantity==0}">
						<input style="width:70px; height:23px;" type="button" value="재입고" id="soldOutAsk" onclick="soldOutAsk('${root}', '${bookDto.book_num}')"/>
					</c:if>
				</div>
			</div>
		</div>
		
		<div class="book_body">
			<div class="book_title">목차</div>
			<span class="book_content">
			<c:if test="${bookDto.book_index !=null}">
				<textarea rows="10" cols="129" disabled="disabled"  style="background-color: white;resize: none;">${bookDto.book_index}
				</textarea>
			</c:if>
			<c:if test="${bookDto.book_index ==null}">
				<textarea rows="10" cols="129" disabled="disabled"  style="background-color: white;resize: none;">목차가 존재 하지 않습니다.
				</textarea>
			</c:if>
			</span>

			<div class="book_title" style="margin-top: 13px;">줄거리</div>
			<span class="book_content">
				<c:if test="${bookDto.book_summary !=null}">
					<textarea rows="10" cols="129" disabled="disabled" style="background-color: white;resize: none;" >${bookDto.book_summary}
					</textarea>
				</c:if>
				<c:if test="${bookDto.book_summary ==null}">
					<textarea rows="10" cols="129" disabled="disabled" style="background-color: white;resize: none;" >줄거리가없습니다.
					</textarea>
				</c:if>
			</span>
		</div>
	</div>
</div>
<%-- <jsp:include page="../main-bottom.jsp"/> --%>
	<br/><br/>
</body>
</html>