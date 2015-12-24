<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/userBook/userBookRead.css"/>
<script type="text/javascript" src="${root}/script/jquery.js"></script>
<script type="text/javascript" src="${root}/script/userBook/script.js"></script>
<jsp:include page="../main-top.jsp"/>
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
<div id="contents" style="height:720px; background:white; border:0px solid black; position: static;">
	  <h2 align="center">공동구매 신청</h2>
<div class="book_read">
	<div class="book_top" style="height: 35%;">	
		<div class="book_cover" id="nav_info">
			<div align="center" style="margin-top: 10px;">
			<c:if test="${bookGroupPurchaseDto.book_cover_file_name !=null}">
				<img src="http://localhost:8181/gobook/images/bookImg/${bookGroupPurchaseDto.book_cover_file_name}" width="60%" height="90%"/>
			</c:if>
			<c:if test="${bookGroupPurchaseDto.book_cover_file_name ==null}">
				<img src="http://localhost:8181/gobook/images/bookImg/a.jpg" width="60%" height="90%"/>
			</c:if>
			</div>
			<br/>
		</div>
		<div class="book_info" id="nav_info">
			<table class="table table-bordered" style="width:860px;  border-spacing:6px; font-size: 14px;">
					<tbody>
						<tr>
							<th style="background:#37415a; color: white;" width="15%" >제목 : </th>
							<td>
							<c:choose>
								<c:when test="${fn:length(bookGroupPurchaseDto.book_name) > 14}">
									<c:out value="${fn:substring(bookGroupPurchaseDto.book_name, 0, 13)}"/>....
								</c:when>
								<c:otherwise>
									<c:out value="${bookGroupPurchaseDto.book_name}"/>
								</c:otherwise>
							</c:choose>
							</td>
						</tr>
						<tr>
							<th style="background:#37415a; color: white;">저자 : </th>
							<td>
							${bookGroupPurchaseDto.book_writer}							
							</td>
						</tr>
						<tr>
							<th style="background:#37415a; color: white;">출판연도 : </th>
							<td>
							<fmt:formatDate value="${bookGroupPurchaseDto.book_publish_date}" pattern="yyyy-MM-dd"/>							
							</td>
						</tr>
						<tr>
							<th style="background:#37415a; color: white;">판매가 : </th>
							<td>
							${bookGroupPurchaseDto.group_purchase_price}						
							</td>
						</tr>
						<tr>
							<th style="background:#37415a; color: white;">희망자 : </th>
							<td id="purchase_count">
							${bookGroupPurchaseDto.group_purchase_count}							
							</td>
						</tr>
						<tr>
							<th style="background:#37415a; color: white;">최소 수량 : </th>
							<td>
							${bookGroupPurchaseDto.group_purchase_min_count}						
							</td>
						</tr>
						<tr>
							<th style="background:#37415a; color: white;">최대 수량  : </th>
							<td>
							${bookGroupPurchaseDto.group_purchase_max_count}						
							</td>
						</tr>
						<tr>
							<th style="background:#37415a; color: white;">마감 기간   : </th>
							<td>
							<fmt:formatDate value="${bookGroupPurchaseDto.group_purchase_date}" pattern="yyyy-MM-dd"/>					
							</td>
						</tr>
					</tbody>
    		</table>
			<c:if test="${bookGroupPurchaseDto.group_purchase_max_count > bookGroupPurchaseDto.group_purchase_count}">
				<c:if test="${id !='admin' && id !=null}">
					<input type="button" style="width: 80px; height: 25px; margin-left: 5px;" value="공동구매신청" id="groupPurchaseAsk" onclick="groupPurchaseInsert('${root}', '${bookGroupPurchaseDto.book_num}', '${bookGroupPurchaseDto.gp_num}')"/>
				</c:if>
			</c:if>
			<br/>
			<c:if test="${bookGroupPurchaseDto.group_purchase_max_count <= bookGroupPurchaseDto.group_purchase_count}">
				공구 수량이 마감되었습니다.
			</c:if>
			</div>				
		</div>
		
		<div class="book_body">
			<div class="book_title" style="font-size: 14px;">목차</div>
			<span class="book_content">
			<c:if test="${bookGroupPurchaseDto.book_index !=null}">
				<textarea rows="10" cols="111" disabled="disabled"  style="font-size: 14px; background-color: white;resize: none;">${bookGroupPurchaseDto.book_index}
				</textarea>
			</c:if>
			<c:if test="${bookGroupPurchaseDto.book_index ==null}">
				<textarea rows="10" cols="111" disabled="disabled"  style="background-color: white;resize: none;font-size: 14px;">목차가 존재 하지 않습니다.
				</textarea>
			</c:if>
			</span>


			<div class="book_title" style="margin-top: 30px; font-size: 14px;">줄거리</div>
			<span class="book_content">
				<c:if test="${bookGroupPurchaseDto.book_summary !=null}">
					<textarea rows="10" cols="111" disabled="disabled" style="background-color: white;resize: none;font-size: 14px;" >${bookGroupPurchaseDto.book_summary}
					</textarea>
				</c:if>
				<c:if test="${bookGroupPurchaseDto.book_summary ==null}">
				<textarea rows="10" cols="111" disabled="disabled" style="background-color: white;resize: none;font-size: 14px;" >줄거리가없습니다.
				</textarea>
				</c:if>
			</span>
		</div>
	</div>
</div>
</body>
</html>