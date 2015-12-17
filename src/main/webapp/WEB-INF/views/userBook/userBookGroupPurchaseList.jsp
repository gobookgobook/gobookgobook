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
</head>
<body>
	<br/><br/>

<div id="contents" style="height:600px; background:white; border:1px solid black"><br/><br/><br/><br/>
<c:if test="${groupList.size()>0}">
	<div align="center">
		<table class="mytable" style="border-collapse: collapse; width: 800px; height: 18px;">
			<tr>
				<td class="mytable" align="center" height="18" width="100">공구번호</td>
				<td class="mytable" align="center" height="18" width="70">도서번호</td>
				<td class="mytable" align="center" height="18" width="240">도서명</td>
				<td class="mytable" align="center" height="18" width="100">도서가격</td>
				<td class="mytable" align="center" height="18" width="100">공구가격</td>
				<td class="mytable" align="center" height="18" width="100">시작수량</td>
				<td class="mytable" align="center" height="18" width="100">마감수량</td>
				<td class="mytable" align="center" height="18" width="70">공구마감일</td>
				<td class="mytable" align="center" height="18" width="120">공구희망자</td>
			</tr>
			
			<c:forEach var="gpList" items="${groupList}">
				<tr>
					<td class="mytable" align="center" height="18">${gpList.gp_num}</td>
				<td class="mytable" align="center" height="18">${gpList.book_num}</td>
				<td class="mytable" align="left" height="18">
				<a href="${root}/userBook/userBookGroupPurchaseRead.do?book_num=${gpList.book_num}">${gpList.book_name}</a>
				</td>
				<td class="mytable" align="center" height="18">${gpList.book_price}</td>
				<td class="mytable" align="center" height="18">${gpList.group_purchase_price}</td>
				<td class="mytable" align="center" height="18">${gpList.group_purchase_min_count}</td>
				<td class="mytable" align="center" height="18">${gpList.group_purchase_max_count}</td>
				<td class="mytable" align="center" height="18"><fmt:formatDate value="${gpList.group_purchase_date}" pattern="yyyy/MM/dd"/></td>
				<td class="mytable" align="center" height="18">${gpList.group_purchase_count}</td>
				</tr>
			</c:forEach>
		</table> 
	</div>
</c:if>
<c:if test="${groupList.size()==0}">
	<label>현재 진행중인 공구가 없습니다.</label>
</c:if>
</div>
<%-- <jsp:include page="../main-bottom.jsp"/> --%>
	<br/><br/>
</body>
</html>