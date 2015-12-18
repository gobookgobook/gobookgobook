<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${root}/script/member/script.js"></script>
<jsp:include page="../main-top.jsp"/>
</head>
<body>
	<br/><br/>
<div id="contents" style="background:white; border:1px solid black"><br/><br/><br/><br/>	

	<div align="center" >
		<form action="${root}/member/delete.do" method="post">
		   <div class="container" style="width:30%">
			<table class="table table-bordered">
				<tr>
				  <th style="background:#B2CCFF">아이디</th>
					<td colspan="3">
					   <input type="text" name="id_check" size="25"/>
					</td>
				</tr>
				
				<tr>
				  <th style="background:#B2CCFF">비밀번호</th>
					<td colspan="3">
					   <input type="password" name="member_password" size="25"/>
					</td>
				</tr>
				
	           <tr align="center">
		         <td colspan="3">
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