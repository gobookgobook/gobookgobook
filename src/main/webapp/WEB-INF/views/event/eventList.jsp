<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<jsp:include page="../admin-top.jsp" />
<meta charset="UTF-8">
<title>이벤트 리스트</title>
<link rel="stylesheet"	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link href="${root}/css/userBook/userBookList.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
	function readFun(root, event_bunho) {
		var url = root + "/event/eventRead.do?event_bunho=" + event_bunho;
		//alert(url);
		location.href = url;
	}
</script>
<style type="text/css">
#nav_info{
      border-bottom: 5px solid #cccccc;
      border-right: 3px solid   #cccccc;
      text-align: center;
      border-left:0px;
      border-top: 0px;
      border-radius: 0px 10px 10px 10px;
   }
</style>
</head>
<body>
<div id="contents" style="height:600px; border:0px solid black; position:static;">
	<div style="margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;border:0px solid black;">
		<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;> 이벤트 관리</b>
	</div>
       
	<div align="left" style="width: 110px;float: left;border:0px solid black;">
		<jsp:include page="eventConNav.jsp"/>
	</div>
		<br/>
		<div align="center" style="border:0px solid black;"><b style="font-size:18px;">이벤트 목록</b></div>
		<div id="event_one" style="border: 0px solid black; width:88%; height: 80%; float: left;">
			<c:forEach var="eventDto" items="${eventList}">
				<div class="bookList" id="nav_info" style="height: 40%;">
					<div style="text-align: center; ">
					<a href="javascript:readFun('${root}','${eventDto.event_bunho}')">
						<img src="${root}/css/event/images/${eventDto.event_file_name}"	title="${eventDto.event_name}" width="70%" height="130px" style="margin-left:20px"/>
					</a>
					</div>
					<div class="userbook_list_all">
						<label class="userBook_title" style="width: 30%;">이벤트 제목 : </label>
						<span class="userBook_content" style="width: 69%;">
							${eventDto.event_name}
						</span>
					</div>
				</div>
			</c:forEach>
		</div>
</div>	
	<jsp:include page="../main-bottom.jsp" />
</body>
</html>