<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../main-top.jsp"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
<div id="contents" style="height:600px; background:white; border:0px solid black; position: static;">
	<div style="margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
			<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;>공동구매 목록</b>
	</div>
	<div style="width: 95%;margin: 0px auto;">
		<div align="left" style="float: left;margin: 10 0 0 10px; width:100%;">
			<div class="container" style="width:100%">
				<table class="table table-bordered">
					<thead>
						<tr class="info" align="center" style="color:white;">
							<th style="background-color:#37415a;">공구번호</th>
							<th style="background-color:#37415a;">도서번호</th>
							<th style="background-color:#37415a;">도서명</th>
							<th style="background-color:#37415a;">도서가격</th>
							<th style="background-color:#37415a;">공구가격</th>
							<th style="background-color:#37415a;">시작수량</th>
							<th style="background-color:#37415a;">마감수량</th>
							<th style="background-color:#37415a;">공구마감일</th>
							<th style="background-color:#37415a;">공구희망자</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${groupList.size()>0}">
							<c:forEach var="gpList" items="${groupList}">
								<tr>
									<td>${gpList.gp_num}</td>
									<td>${gpList.book_num}</td>
									<td>
									<a style="color: blue" href="${root}/userBook/userBookGroupPurchaseRead.do?book_num=${gpList.book_num}">${gpList.book_name}</a>
									</td>
									<td>${gpList.book_price}</td>
									<td>${gpList.group_purchase_price}</td>
									<td>${gpList.group_purchase_min_count}</td>
									<td>${gpList.group_purchase_max_count}</td>
									<td><fmt:formatDate value="${gpList.group_purchase_date}" pattern="yyyy/MM/dd"/></td>
									<td>${gpList.group_purchase_count}</td>
								</tr>
							</c:forEach>
						</c:if>
						
						<c:if test="${groupList.size()==0}">
							<div align="center">현재 진행중인 공구가 없습니다.</div>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../main-bottom.jsp"/>
</body>
</html>