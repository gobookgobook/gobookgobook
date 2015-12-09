<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>QnA등록</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
</head>
<body>
	<h2>QnA</h2>
	<br/><br/>
	
	<div>
		<input type="text" name="subject" value="사용자가 자주 묻는 질문"/>
	</div>
	
	<div>
		<input type="text" name="content"/>
	</div>
	
	<c:if test="${count==0}">
				<div>
					<div>게시판에 저장된 글이 없습니다.</div>
				</div>
	</c:if>
	
	<c:if test="${count > 0}">	
	<div align="center">
		<c:if test="${count > 0}">
			<c:set var="pageBlock" value="${5}"/>
			<%--
				요청페이지번호:5, 총레코드수/페이지당게시물=총페이지수, 페이지블럭
				시작번호: int startPage=(int)((currentPage-1)/pageBlock)*pageBlock+1;
											5-1=4/10=0.4=0*10=0+1=1
				끝번호: int endPage=startPage+pageBlock-1;	// 1+10=11-1=10
			 --%>
		</c:if>
		
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
	</c:if>
	<span>
		<input type="submit" value="QnA등록"/>
	</span>
</body>
</html>
