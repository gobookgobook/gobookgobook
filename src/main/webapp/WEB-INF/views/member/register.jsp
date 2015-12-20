<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:set var="date" value="<%=new Date() %>"/>
<fmt:formatDate var="today" value="${date}" pattern="yyyy"/>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${root}/script/member/script.js"></script>
<jsp:include page="../main-top.jsp"/>
</head>
<body>	
<div id="contents" style="height:580px; background:white; position:static; border:0px solid red;"><br/><br/><br/><br/>
  <div align="center">
	<div class="container" style="width:90%; border:0px solid black; margin-top:-60px;">
	<h2>회원가입</h2>
	<form class="form-horizontal" role="form" name="memberForm" action="${root}/member/register.do" method="post" onsubmit="return registerForm(this)">
	 <div class="form-group">
	 <label class="control-label col-sm-2" for="id">아이디</label>
	 <div class="col-sm-10">
	   <!-- <input type="id" class="form-control" id="id" placeholder -->
	 </div>
	 </div>
	</form>
	</div>
	</div>
	</div>
</body>
</html>