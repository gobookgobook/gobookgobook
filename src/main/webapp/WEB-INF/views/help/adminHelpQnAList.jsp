<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>QnA목록</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<jsp:include page="../admin-top.jsp"/>
</head>
<body>
<div id="contents" style="height:100%; background:white; border:0px solid black;position: static">
	<div id="wrap">
		<div style="margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
			<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;> 고객 센터</b>
		</div>
		
		<div align="left" style="width: 110px;float: left">
			<jsp:include page="adminHelpConNav.jsp"/>
		</div>
		
		<br/>
			<div align="center"><b style="font-size:18px">Q&A</b></div>
		<br/>
		
		<hr><br/>
		
		<c:if test="${count==0}">
			<h3>작성된 게시물이 없습니다.</h3>
		</c:if>
		
		<c:if test="${count > 0}">
					<table>
					<tr><td>사용자가 자주 묻는 질문</td></tr>
					<c:forEach var="help" items="${adminHelpQnAList}">	<%-- 서비스에서 넘겨준 boardList --%>
						<tr>
							<td>${help.helpqna_num}</td>
							<td>
								<a href="${root}/help/adminHelpQnARead.do?helpqna_num=${help.helpqna_num}&pageNumber=${currentPage}">${help.helpqna_subject}</a>
							</td>
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
				<a href="${root}/help/adminHelpQnAList.do?pageNumber=${startPage-pageBlock}">[이전]</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="${root}/help/adminHelpQnAList.do?pageNumber=${i}">[${i}]</a>
			</c:forEach>
			
			<c:if test="${endPage<pageCount}">
				<a href="${root}/help/adminHelpQnAList.do?pageNumber=${startPage+pageBlock}">[다음]</a>
			</c:if>
		</div>
	</div>
</div>	
 <jsp:include page="../main-bottom.jsp"/> 
	<br/><br/>	
</body>
</html>
