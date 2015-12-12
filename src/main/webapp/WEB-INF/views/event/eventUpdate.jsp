<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 수정</title>
</head>
<body>

	<div align="center">
		<form class="form_style" action="${root}/event/eventUpdate.do"
			method="post" onsubmit="return eventForm(this)"
			enctype="multipart/form-data">
			<input type="hidden" name="event_bunho" value="${event_bunho}" />


          <div align="center">
			<div id="name">
				<div class="line">
				    <input type="hidden" name="event_bunho" value="${eventDto.event_bunho}"/>
					<label class="title">이벤트이름</label><br/><br/>
					<span class="content"> 
					<input type="text" name="event_name" value="${eventDto.event_name}" /><br/><br/>
					</span> 
					
					<label class="title">이벤트기간</label>&nbsp;&nbsp; 
			     <div style="width:598px; height:15px; border-width:2px; text-align:right; padding:15px 0px 0px 0px; border-bottom-width:0px;">		
				<input type="text" id="date1" name="event_start_period" value="<fmt:formatDate value='${eventDto.event_start_period}' pattern='yyyy/MM/dd'/>"/>
                  ~
                <input type="text" id="date2" name="event_end_period" value="<fmt:formatDate value='${eventDto.event_end_period}' pattern='yyyy/MM/dd'/>"/>
                <br/><br/> 
				</div>	
					<br/>

					<div class="line" style="height: 230px;">
						<label class="title" style="height: 230px;">이벤트내용</label><br /> 
						<span class="content" style="height: 230px;"> 
						<textarea rows="14" cols="67" name="event_Content">${eventDto.event_Content}</textarea>
						</span>
					</div><br/>
			<div class="line">		
		      <c:if test="${eventDto.event_file_name ==null}">	
					<label class="title">이벤트사진</label> 
					<span class="content">
						<input type="file" name="event_file"/>
					</span><br/><br/>
				</c:if>	
				<c:if test="${eventDto.event_file_name !=null}">	
					<label class="title">이벤트사진</label> 
					<span class="content">
					${eventDto.event_file_name}
						<input type="file" name="event_file"/>
					</span><br/><br/>	
				</c:if>	
            </div>
					<div class="line" style="width: 598px; border-width: 2px; text-align: center;">
						<input type="submit" value="이벤트 수정" /> 
						<input type="button" value="이벤트 목록" onclick="location.href='${root}/event/eventList.do'" />
					</div>
				</div>
			</div>
         </div>
		</form>
	</div>
</body>
</html>