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
<title>공지사항 읽기</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/help/style.css"/>
<script type="text/javascript">
	function deleteFun(root, helpnotice_num){
		var url=root+"/help/adminHelpNoticeDelete.do?helpnotice_num="+helpnotice_num;
		alert("url:"+ url);
		location.href=url;
	}
	
	function updateFun(root, helpnotice_num, pageNumber){
		var url=root+"/help/adminHelpNoticeUpdate.do?helpnotice_num="+helpnotice_num +"&pageNumber="+pageNumber;
		alert(url);
		location.href=url;
	}
</script>
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
			<div align="center"><b style="font-size:18px">공지사항</b></div>
			<br/>
			
			<div align="left" class="container" style="width:835px;padding:0px;margin-left:250px">
				<div>
					<label class="title" style="text-align:center;height:32px;background-color:#dff0d8">제목</label>
					<span class="content" style="height:32px">${helpNoticeDto.helpnotice_subject}</span>
				</div><br/><br/>
				
				<div>
					<label class="title" style="text-align:center;height:32px;background-color:#dff0d8">글쓴이</label>
					<span class="content" style="width:160px;height:32px">관리자</span>
					<label class="title" style="border-left-width:0;text-align:center;height:32px;background-color:#dff0d8">날짜</label>
					<span class="content" style="width:230px;height:32px"><fmt:formatDate value="${helpNoticeDto.helpnotice_writeDate}" type="both" pattern="yy/MM/dd HH:mm:ss"/></span>
				</div><br/><br/>
				
				<div style="height: 67px">
					<label class="title" style="text-align:center;height:204px;border-bottom:2px solid #DDDDDD;background-color:#dff0d8">내용</label>
					<textarea class="content" rows="14" cols="67" name="helpnotice_content" style="background-color:white;border-bottom:2px solid #DDDDDD; resize:none" disabled="disabled">${helpNoticeDto.helpnotice_content}</textarea>
				</div><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
				
				<div style="width:582px;text-align:right">
					<input type="button" value="글삭제" class="btn btn-success btn-sm" onclick="deleteFun('${root}', '${helpNoticeDto.helpnotice_num}')"/>
					<input type="button" value="글수정" class="btn btn-success btn-sm" onclick="updateFun('${root}', '${helpNoticeDto.helpnotice_num}', '${pageNumber}')"/>
					<input type="button" value="목록으로" class="btn btn-success btn-sm" onclick="location.href='${root}/help/adminHelpNoticeList.do?pageNumber=${pageNumber}'"/>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../main-bottom.jsp"/>
	<div>
		<div>
			<table>
				<tr>	
					<td>${helpNoticeDto.helpnotice_content}</td>
				</tr>
			</table>
		</div>
		<input type="button" value="글삭제" onclick="deleteFun('${root}', '${helpNoticeDto.helpnotice_num}')"/>
		<input type="button" value="글수정" onclick="updateFun('${root}', '${helpNoticeDto.helpnotice_num}', '${pageNumber}')"/>
		<input type="button" value="목록으로" onclick="location.href='${root}/help/adminHelpNoticeList.do?pageNumber=${pageNumber}'"/>
	</div>
</body>
</html>
