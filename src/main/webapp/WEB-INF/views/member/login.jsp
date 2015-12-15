<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="${root}/css/member/style.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="${root}/script/member/script.js"></script>
</head>
<body>
	<jsp:include page="../main-top.jsp"/>
	<br/><br/>
<div id="contents" style="background:white; border:1px solid black"><br/><br/><br/><br/>	

	<div align="center" >
		<form action="${root}/member/login.do" method="post">
			<table class="mytable" style="border-collapse:collapse; width:300px;">
				<tr>
					<td class="mytable" >회원ID</td>
					<td class="mytable" ><input type="text" name="member_id"/></td>
				</tr>
				
				<tr>
					<td class="mytable" >비밀번호</td>
					<td class="mytable" ><input type="password" name="member_password"/></td>
				</tr>
				
				<tr>
					<td class="mytable"  colspan="2" align="center">
						<input type="submit" value="확인"/>
						<input type="reset" value="취소"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
<jsp:include page="../main-bottom.jsp"/>
	<br/><br/>		
</body>
</html>