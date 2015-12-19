<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 공지사항목록</title>
<link rel="stylesheet" type="text/css" href="${root}/css/help/style.css"/>
<jsp:include page="../main-top.jsp"/>
</head>
<body>
<div id="contents" style="height:500px; background:white; border:0px solid black; position:static;">
   <div style="background-color:margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
			<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;고객센터</b>
	</div>
   <div align="left" style="width: 120px; float:left; border:0px solid green;">
     <jsp:include page="userCategory.jsp"/>
    <div class="body">
    <div align="center">
	<h1>공지사항</h1>
	<hr>
	<div class="point_body">
	<c:if test="${userHelpQnAList ==null}">
	<div class="user_help_title" style="text-align: center; font-size: 20">
		<span>작성된 게시물이 없습니다.</span>
		</div>
	</c:if>
	
	<c:if test="${userHelpQnAList != null}">
				<table>
				<tr><td>사용자가 자주 묻는 질문</td></tr>
				<c:forEach var="help" items="${userHelpNoticeList}">	<%-- 서비스에서 넘겨준 boardList --%>
					<tr>
						<td>
							<a href="${root}/help/userHelpNoticeRead.do?helpnotice_num=${help.helpnotice_num}&pageNumber=${currentPage}">${help.helpnotice_subject}</a>
						</td>
						<td><fmt:formatDate value="${help.helpnotice_writeDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					</tr>
				</c:forEach>
				</table>
		</c:if>
			
	<div>
		<c:set var="pageBlock" value="${2}"/>
		<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock}" integerOnly="true"/>
		<c:set var="startPage" value="${rs*pageBlock+1}"/>
		<c:set var="endPage" value="${startPage+pageBlock-1}"/>
		
		<c:set var="pageCount" value="${count/boardSize + (count%boardSize==0?0:1)}"/>
		<c:if test="${endPage > pageCount}">
			<c:set var="endPage" value="${pageCount}"/>
		</c:if>
		
		<c:if test="${startPage>pageBlock}">
			<a href="${root}/help/userHelpNotice.do?pageNumber=${startPage-pageBlock}">[이전]</a>
		</c:if>
		
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="${root}/help/userHelpNotice.do?pageNumber=${i}">[${i}]</a>
		</c:forEach>
		
		<c:if test="${endPage<pageCount}">
			<a href="${root}/help/userHelpNotice.do?pageNumber=${startPage+pageBlock}">[다음]</a>
		</c:if>
	</div>
	</div>
	</div>
</div>	
</div>
</div>
<jsp:include page="../main-bottom.jsp"/>
	<br/><br/>		
</body>
</html>
