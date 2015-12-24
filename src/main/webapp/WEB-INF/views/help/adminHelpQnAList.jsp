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
<title>QnA목록</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
<div id="contents" style="height:60%; background:white; border:0px solid black;position: static">
	<div id="wrap">
		<div style="margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
			<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;> 고객 센터</b>
		</div>
		
		<div align="left" style="width: 110px;float: left">
			<jsp:include page="adminHelpConNav.jsp"/>
		</div>
		
		<div align="center"><b style="font-size:18px">Q&A 목록</b></div><br/>
		
		<div align="center" class="container" style="width:835px;padding:0px;margin-left:210px">
			<c:if test="${adminHelpQnAList==null}">
				<div align="center" style="width:835px;margin-left:-120px">
					<table class="table table-bordered">
						<thead>
							<tr class="success" style="color:#1DDB16">
								<th style="font-size:14px;text-align:center">번호</th>
								<th style="font-size:14px;text-align:center">질문</th>
							</tr>
						</thead>
						<tbody id="listAllTd"></tbody>
					</table>
				</div>
				<div align="center" style="font-size:14px;padding-bottom:25px;width:834px;margin-left:-120px; border-bottom:1px solid #DDDDDD">Q&A글이 없습니다.</div>
			</c:if>
			
			<c:if test="${adminHelpQnAList !=null}">
				<div align="center" style="width:835px; padding:0px; margin-left:-110px;">
					<table class="table table-bordered">
						<thead>
							<tr class="success" style="color:#1DDB16">
								<th style="font-size:14px;text-align:center">번호</th>
								<th style="font-size:14px;text-align:center">질문</th>
							</tr>
						</thead>
						<tbody id="listAllTd">
							<c:forEach var="help" items="${adminHelpQnAList}">	<%-- 서비스에서 넘겨준 boardList --%>
								<tr class="success">
									<td style="font-size:14px;text-align:center">${help.helpqna_num}</td>
									<td>
										<a style="font-size:14px" href="${root}/help/adminHelpQnARead.do?helpqna_num=${help.helpqna_num}&pageNumber=${currentPage}">${help.helpqna_subject}</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:if>
					
			<div style="margin-left:-130px">
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
</div>	

<jsp:include page="../main-bottom.jsp"/> 
</body>
</html>
