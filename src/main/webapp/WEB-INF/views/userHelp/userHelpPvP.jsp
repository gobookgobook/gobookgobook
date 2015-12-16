<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 1:1문의 등록</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
</head>
<body>
	<h2>1:1문의 내역</h2>
	<hr>
	<br/><br/>
	<div>
		<form action="${root}/help/userHelpPvP.do" method="post">
			<div>
			<label>제목</label>
				<input type="text" name="helppvp_user_subject" size="58"/><br/>
			<label>내용</label>	
				<textarea rows="7" cols="60" name="helppvp_user_content"></textarea><br/>
			</div>
			<div>
				<input type="submit" value="보내기"/>
			</div>
		</form>
	</div>
</body>
</html>
