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
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<br/><br/>
	
	<div align="center" >
		<form action="${root}/member/login.do" method="post" name="loginOk">
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