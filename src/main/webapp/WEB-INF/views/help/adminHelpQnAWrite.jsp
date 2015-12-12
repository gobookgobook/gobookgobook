<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>QnA등록</title>
<link href="${root}/css/help/style.css" type="text/css" rel="stylesheet">
<c:set var="root" value="${pageContext.request.contextPath}"/>
</head>
<body>
	<jsp:include page="../member/menu.jsp"/>
   <br/><br/>
	<div>
	
		<h3>QnA등록</h3>
		<hr>
		<div>
			<a href="${root}/help/adminHelpPvPList.do">1:1문의</a>
			<a href="${root}/help/adminHelpQnAList.do">QnA</a>
			<a href="${root}/help/adminHelpNoticeList.do">공지사항</a>
		</div><br/><br/>
			<form action="${root}/help/adminHelpQnAWrite.do" method="post" onsubmit="return adminHelpQnAWrite(this)">
			<div class="line">
				<label class="title">질문</label>
					<span><input type="text" size="50" name="helpqna_subject"/></span>
			</div><br/><br/>
		
			<div style="height:230px;">
				<label>내용</label>
					<span style="height:230px;">
						<textarea rows="14" cols="67" name="helpqna_content"></textarea>
					</span>
			</div><br/><br/>
		
			<div>
				<input type="submit" value="QnA등록"/>
			</div>
		</form>
	</div>
</body>
</html>
