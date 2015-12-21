<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<jsp:include page="../admin-top.jsp"/>
<meta charset="UTF-8">
<title>공지사항 등록</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/help/style.css"/>
</head>
<body>
	<div id="contents" style="height:100%; background:white; border:0px solid black;position: static">
		<div id="wrap">
			<div style="margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
				<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;> 고객 센터</b>
			</div>
			
			<div align="left" style="width: 110px;float: left">
				<jsp:include page="adminHelpConNav.jsp"/>
			</div>
			
			<br/>
			<div align="center"><b style="font-size:18px">공지사항 쓰기</b></div>
			<br/>
			
			<hr><br/>
			<div align="center" class="container" style="width:835px;padding:0px;margin-left:130px">
			 	<form style="margin-left:130px" action="${root}/help/adminHelpNoticeWrite.do" method="post" onsubmit="return adminHelpNoticeWrite(this)">
					<div>
						<label class="title" style="height:32px;color:#1DDB16;background-color:#dff0d8">제목</label>
						<input class="content" type="text" size="50" name="helpnotice_subject" style="height:32px"/>
					</div><br/><br/>
					
					<div style="height: 67px">
						<label class="title" style="height:204px;border-bottom:2px solid #DDDDDD;color:#1DDB16;background-color:#dff0d8">내용</label>
						<textarea class="content" rows="14" cols="67" name="helpnotice_content" style="border-bottom:2px solid #DDDDDD; resize:none"></textarea>
					</div><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

					<div>
						<input type="submit" class="btn btn-success btn-sm" value="공지사항 등록"  style="margin-left:-100px"/>
					</div>
				</form>
			</div>
		</div>
	</div>	
	
	<jsp:include page="../main-bottom.jsp"/>
</body>
</html>
