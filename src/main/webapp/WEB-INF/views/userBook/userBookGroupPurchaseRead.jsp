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
<div id="contents" style="height:600px; background:white; border:1px solid black">
	  <h2 align="center">공동구매 신청</h2>
<div class="book_read">
	<div class="book_top">	
		<div class="book_cover">
			<div align="center" style="margin-top: 10px;">
				<img src="#" width="50%" height="90%"/>
			</div>
			<br/>
		</div>
		<div class="book_info">
			<table class="table table-bordered" style="width:860px;">
					<tbody>
						<tr>
							<th style="background:#37415a; color: white;" width="15%" >제목 : </th>
							<td>
							${bookGroupPurchaseDto.book_name}								
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
					<input type="button" value="공동구매신청" id="groupPurchaseAsk" onclick="groupPurchaseInsert('${root}', '${bookGroupPurchaseDto.book_num}', '${bookGroupPurchaseDto.gp_num}')"/>
				</c:if>
			</c:if>
			<br/>
			<c:if test="${bookGroupPurchaseDto.group_purchase_max_count <= bookGroupPurchaseDto.group_purchase_count}">
				공구 수량이 마감되었습니다.
			</c:if>
			</div>				
		</div>
		
		<div class="book_body">
			<label class="book_title">목차</label>
			<span class="book_content">
			<c:if test="${bookGroupPurchaseDto.book_index !=null}">
				<textarea rows="10" cols="110" disabled="disabled"  style="background-color: white;resize: none;">${bookGroupPurchaseDto.book_index}
				</textarea>
			</c:if>
			<c:if test="${bookGroupPurchaseDto.book_index ==null}">
				목차가 존재 하지 않습니다.
			</c:if>
			</span>


			<label class="book_title">줄거리</label>
			<span class="book_content">
				<c:if test="${bookGroupPurchaseDto.book_summary !=null}">
					<textarea rows="10" cols="110" disabled="disabled" style="background-color: white;resize: none;" >${bookGroupPurchaseDto.book_summary}
					</textarea>
				</c:if>
				<c:if test="${bookGroupPurchaseDto.book_summary ==null}">
					줄거리가없습니다.	
				</c:if>
			</span>
		</div>
	</div>
</div>
<jsp:include page="../main-bottom.jsp"/>
</body>
</html>