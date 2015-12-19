<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/bookManage/tablea.css"/>
</head>
<body>
	<table class="table table-bordered">
		<tr>
			<td style="background:#41AF39"><a id="tda" href="${root}/help/adminHelpNoticeWrite.do" >공지사항 쓰기</a></td>
		</tr>
		
		<tr>
			<td style="background:#41AF39"><a id="tda" href="${root}/help/adminHelpNoticeList.do">공지사항 목록</a></td>
		</tr>
		
		<tr>
			<td style="background:#41AF39"><a id="tda" href="${root}/help/adminHelpQnAWrite.do">Q&A 쓰기</a></td>
		</tr>
		
		<tr>
			<td style="background:#41AF39"><a id="tda" href="${root}/help/adminHelpQnAList.do">Q&A 목록</a></td>
		</tr>
	</table>
</body>
</html>