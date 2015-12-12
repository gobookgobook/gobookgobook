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
<link href="${root}/css/help/style.css" type="text/css" rel="stylesheet"/>
</head>
<body>
	<jsp:include page="../member/menu.jsp"/>
   <br/><br/>
   
   <h2>QnA</h2>
	<hr>
	<br/><br/>
	
	
	<c:if test="${count==0}">
		<h3>작성된 게시물이 없습니다.</h3>
	</c:if>
	
<%--  	<c:if test="${count> 0}"> --%>
<!-- 	<div> -->
<!-- 		<div>사용자가 자주 묻는 질문</div> -->
		
<!-- 	</div> -->
<%-- 	</c:if>	 --%>
	
	<c:if test="${count > 0}">
				<div class="title">사용자가 자주 묻는 질문</div>
				<c:forEach var="help" items="${adminHelpQnAListSelect}">	<%-- 서비스에서 넘겨준 boardList --%>
					<tr>
						<td>${help.helpqna_num}</td>
						<td>
							<a href="${root}/help/adminHelpQnARead.do?helpqna_num=${help.helpqna_num}&pageNumber=${currentPage}">${help.helpqna_subject}</a>
						</td>
					</tr>
				</c:forEach>
		</c:if>
<%-- 	${HelpQnADto.helpqna_content} --%>
	
		
			<%--
				요청페이지번호:5, 총레코드수/페이지당게시물=총페이지수, 페이지블럭
				시작번호: int startPage=(int)((currentPage-1)/pageBlock)*pageBlock+1;
											5-1=4/10=0.4=0*10=0+1=1
				끝번호: int endPage=startPage+pageBlock-1;	// 1+10=11-1=10
			--%>
			
	<div>
		<c:set var="pageBlock" value="${10}"/>
		<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock}" integerOnly="true"/>
		<c:set var="startPage" value="${rs*pageBlock+1}"/>
		<c:set var="endPage" value="${startPage+pageBlock-1}"/>
		
		<c:set var="pageCount" value="${count/boardSize + (count%boardSize==0?0:1)}"/>
		<c:if test="${endPage > pageCount}">
			<c:set var="endPage" value="${pageCount}"/>
		</c:if>
		
		<c:if test="${startPage>pageBlock}">
			<a href="${root}/help/adminHelpQnAListSelect.do?pageNumber=${startPage-pageBlock}">[이전]</a>
		</c:if>
		
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="${root}/help/adminHelpQnAListSelect.do?pageNumber=${i}">[${i}]</a>
		</c:forEach>
		
		<c:if test="${endPage<pageCount}">
			<a href="${root}/help/adminHelpQnAListSelect.do?pageNumber=${startPage+pageBlock}">[다음]</a>
		</c:if>
	</div>
</body>
</html>
