<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 QnA읽기</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
</head>
<body>
	<div>
		<div>
			<table>
				<tr>	
					<td>${HelpQnADto.helpqna_content}</td>
				</tr>
			</table>
		</div>
		<input type="button" value="목록으로" onclick="location.href='${root}/help/userHelpQnA.do?pageNumber=${pageNumber}'"/>
	</div>
</body>
</html>
