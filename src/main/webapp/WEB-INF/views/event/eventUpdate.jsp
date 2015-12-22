<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<jsp:include page="../admin-top.jsp"/>
<meta charset="UTF-8">
<title>이벤트 수정</title>
<script type="text/javascript" src="${root}/script/event/start/jquery.js"></script>
<script type="text/javascript" src="${root}/script/event/start/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/script/event/start/jquery-ui.css"/>
<script type="text/javascript" src="${root}/script/event/script.js"></script>
<script type="text/javascript">
$(function(){
	 
	 $("#date1,#date2").datepicker({
		 dateFormat:"yy/mm/dd",
		 monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		 dayNamesMin:["일","월","화","수","목","금","토"],
		
	 });
 });
</script>
</head>
<body>
<div id="contents" style="height:600px; background:white; border:0	px solid black">
<div style="margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
		<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;> 이벤트 관리</b>
		</div>
		       
		<div align="left" style="width: 110px;float: left;">
			<jsp:include page="eventConNav.jsp"/>
		</div>

		<br/>
			<div align="center"><b style="font-size:18px">이벤트 수정</b></div>
		<br/>	
	<div align="center">
		<form class="form_style" action="${root}/event/eventUpdate.do"
			method="post" onsubmit="return eventForm(this)"
			enctype="multipart/form-data">
			<input type="hidden" name="event_bunho" value="${event_bunho}" />

          <div align="center">
	          <table class="table table-bordered" style="width: 70%; height: 60%;">
					<tr>
						<th style="background:#dff0d8;">이벤트 이름</th>
						<td><input type="text" name="event_name" value="${eventDto.event_name}"/></td>
					</tr>
					<tr>
						<th style="background:#dff0d8;">이벤트 기간</th>
						<td>
						<input type="text" id="date1" name="start_period" disabled="disabled" value="<fmt:formatDate value='${eventDto.event_start_period}' pattern='yyyy/MM/dd'/>"/>
						<input type="hidden" name="event_start_period"/>
						~
						<input type="text" id="date2" name="end_period" disabled="disabled" value="<fmt:formatDate value='${eventDto.event_end_period}' pattern='yyyy/MM/dd'/>"/>
						<input type="hidden" name="event_end_period"/>
						</td>
					</tr>
					<tr>
						<th style="background:#dff0d8;">이벤트 내용</th>
						<td>
						<textarea rows="14" cols="67" name="event_Content" style="resize: none;">${eventDto.event_Content}</textarea>
						</td>
					</tr>
					<tr>
						<th style="background:#dff0d8;">이벤트 사진</th>
						<td>
							<c:if test="${eventDto.event_file_name ==null}">	
								<input type="file" name="event_file"/>
							</c:if>	
							<c:if test="${eventDto.event_file_name !=null}">	
								${event_file_name}
								<input type="file" name="event_file"/>
							</c:if>	
						</td>
					</tr>
				</table>
			<div class="line" style="width:598px; border-width:2px; text-align:center;">
				<input style="width: 80px; height: 30px;" type="submit" value="이벤트 수정" /> 
				<input style="width: 80px; height: 30px;" type="button" value="이벤트 목록" onclick="location.href='${root}/event/eventList.do'" />
			</div>
		</div>
		</form>
	</div>
</div>
<jsp:include page="../main-bottom.jsp"/>
</body>
</html>