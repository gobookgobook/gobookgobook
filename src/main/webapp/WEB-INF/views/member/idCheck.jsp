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
	<c:if test="${check>0 }">
		<div align="center">
			이미 사용중인 아이디 입니다.
			<form action="${root}/member/idCheck.do" method="post">
				<input type="text" name="member_id"/>
				<input type="submit" value="확인"/>
			</form>
		</div>
	</c:if>
	
	<c:if test="${check==0 }">
		<div align="center">
			사용가능한 아이디 입니다.<br/>
			사용 하시겠습니까?<br/>
			<script type="text/javascript">
				opener.memberForm.id_check.value="${id}"
			</script>
			<input type="button" value="사용" onclick="chooseId()"/>
			<input type="button" value="취소" onclick="resetId('${root}')"/>
		</div>
	</c:if>
	
	<c:if test="${check==-1 }">
		<div align="center">
			새로운 아이디를 입력하세요.
			<form action="${root}/member/idCheck.do" method="post">
				<input type="text" name="member_id"/>
				<input type="submit" value="확인"/>
			</form>
		</div>
	</c:if>
	
	<div align="center">
		<div align="center">
			<input type="button" value="닫기" onclick="cancel()"/>
		</div>
	</div>
</body>
</html>