<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${root}/script/member/script.js"></script>
<jsp:include page="../main-top.jsp"/>
</head>
<body>
	<br/><br/>
<div id="contents" style="background:white; border:0px solid black; position:static;"><br/><br/><br/><br/>	
	<div align="center" >
		<form action="${root}/member/login.do" method="post">
		<div class="container" style="width:90%; ">
		<h2>로그인</h2>
		
		<div id="member_id" style="margin:10px;">	
		<input type="text" name="member_id" value="아이디" style="background:#37415a; color:white;" disabled="disabled"/>
		<input type="text" name="id_check" size="30"/><br/>
		</div>
		
		<div id="member_password" style="margin:10px;">
		<input type="text" name="member_password" value="비밀번호" style="background:#37415a; color:white;"  disabled="disabled"/>
        <input type="password" name="member_password" size="30"/><br/>
        </div>
        <input type="submit" size="40"  value="확인"/>	
        <input type="reset" size="40"  value="취소"/>	
			</div>
		</form>
	</div>
</div>
<jsp:include page="../main-bottom.jsp"/>
	<br/><br/>		
</body>
</html>