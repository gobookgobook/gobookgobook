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
			<table class="table table-bordered">
				<tr>
				  <th style="background:#37415a; color:white; font-size:14px; text-align:center;">아이디</th>
					<td colspan="3">
					   <input type="text" name="member_id" size="25"/>
					</td>
				</tr>
				
				<tr>
				  <th style="background:#37415a; color:white; font-size:14px; text-align:center; ">비밀번호</th>
					<td colspan="3">
					   <input type="password" name="member_password" size="25"/>
					</td>
				</tr>
				
	           <tr align="center">
		         <td colspan="5">
		           <input type="submit" class="btn btn-primary btn-xs" value="확인"/>
			       <input type="reset" class="btn btn-warning btn-xs" value="취소"/>
		         </td>
		       </tr>
			</table>
			</div>
		</form>
	</div>
</div>
<jsp:include page="../main-bottom.jsp"/>
	<br/><br/>		
</body>
</html>