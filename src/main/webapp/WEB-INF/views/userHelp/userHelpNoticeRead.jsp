<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<jsp:include page="../admin-top.jsp"/>
<meta charset="UTF-8">
<title>사용자 공지사항 읽기</title>
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
				<jsp:include page="userCategory.jsp"/>
			</div>
			
			<br/>
			<div align="center"><b style="font-size:18px">공지사항</b></div>
			<br/>
			
			<div align="left" class="container" style="width:835px;padding:0px;margin-left:250px">
				<div>
					<label class="title" style="text-align:center;height:32px;color:white;background-color:#37415a">제목</label>
					<span class="content" style="height:32px">${helpNoticeDto.helpnotice_num}</span>
				</div><br/><br/>
				
				<div>
					<label class="title" style="text-align:center;height:32px;color:white;background-color:#37415a">글쓴이</label>
					<span class="content" style="width:160px;height:32px">관리자</span>
					<label class="title" style="border-left-width:0;text-align:center;height:32px;color:white;background-color:#37415a">날짜</label>
					<span class="content" style="width:230px;height:32px"><fmt:formatDate value="${helpNoticeDto.helpnotice_writeDate}" type="both" pattern="yy/MM/dd HH:mm:ss"/></span>
				</div><br/><br/>
				
				<div style="height: 67px">
					<label class="title" style="text-align:center;height:204px;border-bottom:2px solid #DDDDDD;color:white;background-color:#37415a">내용</label>
					<textarea class="content" rows="14" cols="67" name="helpnotice_content" style="border-bottom:2px solid #DDDDDD; resize:none" disabled="disabled">${helpNoticeDto.helpnotice_content}</textarea>
				</div><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
			</div>
			
			<div align="right" style="width:83%">
				<input type="button" class="btn btn-primary btn-sm" value="목록" style="margin-left:-100px" onclick="location.href='${root}/userHelp/userHelpNotice.do?pageNumber=${pageNumber}'"/>
			</div>
		</div>
	</div>
	
	<jsp:include page="../main-bottom.jsp"/>
</body>
</html>
