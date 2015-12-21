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
	<br/><br/>
<div id="contents" style="background:white; border:0px solid black; position:static; height:300px;"><br/><br/><br/><br/>	
	<div align="center" >
		<form action="${root}/member/login.do" method="post">
		<div class="container" style="width:90%; margin-top:-60px;">
		
		<div align="center"><b style="font-size:18px">로그인</b></div>
         <br/>
		
		<div id="member_id" style="margin:10px;">	
		<input type="text" name="idName" value="아이디" style="background:#1993A8; color:white; height:30px;" disabled="disabled"/>
		<input type="text" name="member_id" size="30" style="height:30px;" /><br/>
		</div>
		
		<div id="member_password" style="margin:10px;">
		<input type="text" name="passwordName" value="비밀번호" style="background:#1993A8; color:white; height:30px;"  disabled="disabled"/>
        <input type="password" name="member_password" size="30" style="height:30px;"/><br/><br/>
        </div>
        <input type="submit" size="40" style="width:50px; height:30px;" value="확인"/>	
        <input type="reset" size="40"  style="width:50px; height:30px;" value="취소"/>	
			</div>
		</form>
	</div>
</div>

	<c:if test="${deleteId > 0}">
		<script type="text/javascript">
			alert("탈퇴처리된 회원입니다.");
			location.href="${root}/member/login.do";
		</script>
	</c:if>
	
	<c:if test="${deleteId == 0 }">
		<c:if test="${loginId != null }">
			<c:set var="id" value="${loginId }" scope="session"/>
			
			<script type="text/javascript">
				location.href="${root}/member/goBookMain.do";
			</script>
		</c:if>
		
		<c:if test="${loginId == null }">
			<script type="text/javascript">
				alert("Id, Password를 다시한번 확인해주세요.")
				location.href="${root}/member/login.do";
			</script>
		</c:if>
	</c:if>

</body>
</html>