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
<script type="text/javascript">
	function readFun(root, event_bunho) {
		var url = root + "/event/eventRead.do?event_bunho=" + event_bunho;
		//alert(url);
		location.href = url;
	}
</script>
</head>
<body>
	<div id="contents" style="height:500px;background:white; border:0px solid black; position:static">
			<c:if test="${id=='admin'}">
				<div style="margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
			         <b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;> 이벤트 관리</b>
		       </div>
		       
		       <div align="left" style="width: 110px;float: left;">
			      <jsp:include page="eventConNav.jsp"/>
		        </div>
			</c:if>
	     <br/>
			<div align="center"><b style="font-size:18px">이벤트 목록</b></div>
         <br/><br/><br/><br/>
         <div align="center">
			<div id="event_one" style="margin-left:100px;">
				<c:forEach var="eventDto" items="${eventList}">
					<div id="event_id" style="border:0px solid red; width:280px; height:180px; float:left;">
						<a href="javascript:readFun('${root}','${eventDto.event_bunho}')">
							<img src="${root}/css/event/images/${eventDto.event_file_name}"	title="${eventDto.event_name}" width="300" height="100;" style="margin-left:20px"/><br/><br/>${eventDto.event_name}
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
		</div><br/>

		
	<jsp:include page="../main-bottom.jsp" />
</body>
</html>