<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<jsp:include page="../admin-top.jsp"/>
<meta charset="UTF-8">
<title>QnA등록</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link href="${root}/css/help/style.css" type="text/css" rel="stylesheet">
</head>
<body>
	<div id="contents" style="height:70%; background:white; border:0px solid black;position: static">
		<div id="wrap">
			<div style="margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
				<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;> 고객 센터</b>
			</div>
	
			<div align="left" style="width: 110px;float: left">
				<jsp:include page="adminHelpConNav.jsp"/>
			</div>
	
			<div align="center"><b style="font-size:18px">Q&A 쓰기</b></div>
	
			<hr><br/>
			<div align="center" class="container" style="width:960px;height:460px;padding:0px;border:0px solid black;margin-left:40px">
				<form style="margin-left:130px" action="${root}/help/adminHelpQnAWrite.do" method="post" onsubmit="return adminHelpQnAWrite(this)">
					<div>
						<label class="title" style="width:200px;font-size:14px;margin-bottom:0px;height:40px;background-color:#dff0d8">질문</label>
						<input class="content" type="text" size="50" name="helpqna_subject" style="width:610px;font-size:14px;height:40px"/>
					</div><br/><br/>
					
					<div style="height: 67px">
						<label class="title" style="width:200px;font-size:14px;height:288px;border-bottom:2px solid #DDDDDD;background-color:#dff0d8">내용</label>
						<textarea class="content" rows="14" cols="64" name="helpqna_content" style="height:288px;width:610px;font-size:14px;border-bottom:2px solid #DDDDDD; resize:none"></textarea>
					</div>

					<div style="margin-top:250px">
						<input type="submit" class="btn btn-success btn-sm" value="Q&A 등록"  style="margin-left:-50px"/>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="../main-bottom.jsp"/>
</body>
</html>
