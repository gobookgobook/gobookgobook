<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>QnA등록</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
</head>
<body>
	<div>
		<div>
			<a href="${root}/help/adminHelpPvPList.do">1:1문의</a>
			<a href="${root}/help/adminHelpQnAList.do">QnA</a>
			<a href="${root}/help/adminHelpNoticeList.do">공지사항</a>
		</div>
		
			<form action="${root}/help/adminHelpQnAWrite.do" method="post" onsubmit="return helpForm(this)">
				<input type="hidden" name="helpqna_num" value="${helpqna_num}"/>
				<input type="hidden" name="qnagroup_number" value="${qnagroup_number}"/>
				<input type="hidden" name="qnasequence_number" value="${qnasequence_number}"/>
				<input type="hidden" name="qnasequence_level" value="${qnasequence_level}"/>
		
			<div>
				<label>질문</label>
					<span><input type="text" size="50" name="subject"/></span>
			</div><br/><br/>
		
			<div style="height:230px;">
				<label>내용</label>
					<span style="height:230px;">
						<textarea rows="14" cols="67" name="content"></textarea>
					</span>
			</div><br/><br/>
		
			<div>
				<input type="submit" value="QnA등록"/>
			</div>
		</form>
	</div>
</body>
</html>
