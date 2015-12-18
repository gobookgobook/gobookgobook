<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${root}/css/member/style.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="${root}/script/member/script.js"></script>
<jsp:include page="../main-top.jsp"/>
</head>
<body>
<div id="contents" style="background:white; border:1px solid black"><br/><br/><br/><br/>	
	<div align="center" >
		<form action="${root}/member/login.do" method="post">
		<div class="container" style="width:30%">
			<table class="table table-bordered">
				<tr>
				  <th style="background:#B2CCFF">아이디</th>
					<td colspan="3">
					   <input type="text" name="member_id" size="25" value="${memberDto.member_id }"/>
					</td>
				</tr>
				
				<tr>
				  <th style="background:#B2CCFF">비밀번호</th>
					<td colspan="3">
					   <input type="password" name="member_password" size="25" value="${memberDto.member_password }"/>
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

	<c:if test="${loginId != null }">
		<c:set var="id" value="${loginId }" scope="session"/>
		
		<script type="text/javascript">
			alert("로그인 성공 했습니다.");
			location.href="${root}/member/goBookMain.do";
		</script>
	</c:if>
	
	<c:if test="${loginId == null }">
		<script type="text/javascript">
			alert("로그인 실패했습니다.\nId, Password를 다시 확인해 주세요.");
			location.href="${root}/member/login.do";
		</script>
	</c:if>
</body>
</html>