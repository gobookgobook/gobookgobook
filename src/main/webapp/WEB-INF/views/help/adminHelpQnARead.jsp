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
<title>QnA읽기</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link href="${root}/css/help/style.css" type="text/css" rel="stylesheet">

<script type="text/javascript">
	function deleteFun(root, helpqna_num){
		var url=root+"/help/adminHelpQnADelete.do?helpqna_num="+helpqna_num;
		//alert(url);
		location.href=url;
	}
	
	function updateFun(root, helpqna_num, pageNumber){
		var url=root+"/help/adminHelpQnAUpdate.do?helpqna_num="+helpqna_num+"&pageNumber="+pageNumber;
		//alert(url);
		location.href=url;
	}
</script>
</head>
<body>
	<div id="contents" style="height:50%; background:white; border:0px solid black;position: static">
		<div id="wrap">
			<div style="margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
				<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;> 고객 센터</b>
			</div>
			
			<div align="left" style="width: 110px;float: left">
				<jsp:include page="adminHelpConNav.jsp"/>
			</div>
			
			<div align="center"><b style="font-size:18px">Q&A</b></div>
			<br/>
		
			<div align="left" class="container" style="width:835px;padding:0px;margin-left:180px">
				<div>
					<label class="title" style="text-align:center;width:200px;height:70px;font-size:14px;background-color:#dff0d8">질문</label>
					<span class="content" style="width:600px;height:70px;font-size:14px;">${helpQnADto.helpqna_subject}</span>
				</div><br/><br/>
			
				<div style="height: 200px">
					<label class="title" style="text-align:center;width:200px;height:150px;font-size:14px;border-bottom:2px solid #DDDDDD;background-color:#dff0d8">답변</label>
					<textarea class="content" rows="14" cols="67" name="helpQnA_content" style="background-color:white;border-bottom:2px solid #DDDDDD; resize:none; width:600px; height:150px; font-size:14px;" disabled="disabled">${helpQnADto.helpqna_content}</textarea>
				</div>
				
				<div style="height:300px;margin-top:250px;width:93%;text-align:center;margin-top:20px">
					<input type="button" class="btn btn-success btn-sm" value="글삭제" onclick="deleteFun('${root}', '${helpQnADto.helpqna_num}')"/>
					<input type="button" class="btn btn-success btn-sm" value="글수정" onclick="updateFun('${root}', '${helpQnADto.helpqna_num}', '${pageNumber}')"/>
					<input type="button" class="btn btn-success btn-sm" value="목록으로" onclick="location.href='${root}/help/adminHelpQnAList.do?pageNumber=${pageNumber}'"/>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../main-bottom.jsp"/>
</body>
</html>
