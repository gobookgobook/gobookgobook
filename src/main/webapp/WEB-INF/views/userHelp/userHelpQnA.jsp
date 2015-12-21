<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<jsp:include page="../main-top.jsp"/>
<meta charset="UTF-8">
<title>사용자 QnA</title>
<link rel="stylesheet" type="text/css" href="${root}/css/help/style.css"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
<div id="contents" style="height:500px; background:white; margin-top:0px; border:0px solid black; position:static;">
	<div style="background-color:margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
		<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;> 고객센터</b>
	</div>
	
    <div align="left" style="width: 120px; float:left; border:0px solid black;">
    	<jsp:include page="userCategory.jsp"/>
    <div class="body" style="margin-left:250px;width:1000px;height:500px;border:0px solid black">
	    <div align="center" style="width:600px;border:0px solid black">
			
			<br/>
		    <div align="center"><b style="font-size:18px">Q&A</b></div>
		    <br/>
			
			<div class="point_body" style="width:400px;margin-left:110px">
				<c:if test="${userHelpQnAList ==null}">
					<div align="center" style="width:400px">
						<table class="table table-bordered">
							<thead>
								<tr style="color:white;background-color:#37415a">
									<th style="text-align:center">번호</th>
									<th style="text-align:center">질문</th>
								</tr>
							</thead>
							<tbody id="listAllTd"></tbody>
						</table>
					</div>
					<div align="center" style="padding-bottom:25px; border-bottom:1px solid #DDDDDD">Q&A글이 없습니다.</div>
				</c:if>
				
				<c:if test="${userHelpQnAList != null}">
					<div align="center" style="width:400px">
						<table class="table table-bordered">
							<thead>
								<tr style="color:white;background-color:#37415a">
									<th style="text-align:center">번호</th>
									<th style="text-align:center">질문</th>
								</tr>
							</thead>
							<tbody id="listAllTd">
								<c:forEach var="help" items="${userHelpQnAList}">	<%-- 서비스에서 넘겨준 boardList --%>
									<tr>
										<td style="text-align:center">${help.helpqna_num}</td>
										<td>
											<a href="${root}/userHelp/userHelpQnARead.do?helpqna_num=${help.helpqna_num}&pageNumber=${currentPage}">${help.helpqna_subject}</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:if>
						
				<div align="center" style="width:350px">
					<c:set var="pageBlock" value="${2}"/>
					<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock}" integerOnly="true"/>
					<c:set var="startPage" value="${rs*pageBlock+1}"/>
					<c:set var="endPage" value="${startPage+pageBlock-1}"/>
					
					<c:set var="pageCount" value="${count/boardSize + (count%boardSize==0?0:1)}"/>
					<c:if test="${endPage > pageCount}">
						<c:set var="endPage" value="${pageCount}"/>
					</c:if>
					
					<c:if test="${startPage>pageBlock}">
						<a href="${root}/help/userHelpQnA.do?pageNumber=${startPage-pageBlock}">[이전]</a>
					</c:if>
					
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<a href="${root}/help/userHelpQnA.do?pageNumber=${i}">[${i}]</a>
					</c:forEach>
					
					<c:if test="${endPage<pageCount}">
						<a href="${root}/help/userHelpQnA.do?pageNumber=${startPage+pageBlock}">[다음]</a>
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
