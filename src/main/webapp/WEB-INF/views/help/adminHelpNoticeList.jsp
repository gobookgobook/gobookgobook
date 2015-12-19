<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<jsp:include page="../admin-top.jsp"/>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
	<div id="contents" style="height:100%; background:white; border:0px solid black;position: static">
		<div id="wrap">
			<div style="background-color: #41AF39;margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
				<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;고객 센터</b>
			</div>
			
			<div align="left" style="width: 110px;float: left">
				<jsp:include page="adminHelpConNav.jsp"/>
			</div>
			
		    <h1 style="margin-left:20px">공지사항</h1>
			
			<div align="center" class="container" style="width:835px;padding:0px;margin-left:130px">
				<c:if test="${count==0}">
					<h3>작성된 게시물이 없습니다.</h3>
				</c:if>
				
				<c:if test="${count > 0}">
							<table>
							<tr><td>사용자가 자주 묻는 질문</td></tr>
							<c:forEach var="help" items="${adminHelpNoticeListSelect}">	<%-- 서비스에서 넘겨준 boardList --%>
								<tr>
									<td>${help.helpnotice_num}</td>
									<td>
										<a href="${root}/help/adminHelpNoticeRead.do?helpnotice_num=${help.helpnotice_num}&pageNumber=${currentPage}">${help.helpnotice_subject}</a>
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
						<a href="${root}/help/adminHelpNoticeList.do?pageNumber=${startPage-pageBlock}">[이전]</a>
					</c:if>
					
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<a href="${root}/help/adminHelpNoticeList.do?pageNumber=${i}">[${i}]</a>
					</c:forEach>
					
					<c:if test="${endPage<pageCount}">
						<a href="${root}/help/adminHelpNoticeList.do?pageNumber=${startPage+pageBlock}">[다음]</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../main-bottom.jsp"/>
</body>
</html>
