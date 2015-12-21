<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<jsp:include page="../admin-top.jsp"/>
<meta charset="UTF-8">
<title>이벤트 열람</title>
<script type="text/javascript">
   function updateFun(root, event_bunho){
	   var url=root + "/event/eventUpdate.do?event_bunho="+event_bunho;
	   //alert(url);
	   location.href=url;
   }
   
   function deleteFun(root,event_bunho){
	   var check= confirm("삭제 하시겠습니까?");
	   if(check==true){
		   location.href=root +"/event/eventDelete.do?event_bunho="+event_bunho;
	   }
	   return check;
   }
   
</script>
</head>
<body>
<div id="contents" style="height:600px; background:white; border:0px solid black; position:static; ">
              <c:if test="${id=='admin'}">
				<div style="margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
			         <b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;> 이벤트 관리</b>
		       </div>
		       
		       <div align="left" style="width: 110px;float: left;">
			      <jsp:include page="eventConNav.jsp"/>
		        </div>
			</c:if>
	         <br/>
			<div align="center" style="border:0px solid red; height:50px;"><b style="font-size:18px"></b></div>			 
<div align="right">
<div style="width:250px; height:15px; border-width:2px; text-align:center;">
       
       <label class="title"><fmt:formatDate value="${eventDto.event_start_period}"/></label>
       ~
       <label class="title"><fmt:formatDate value="${eventDto.event_end_period}"/></label>
</div>

<div align="center">
<div style="width:200px; height:15px; border-width:2px; text-align:left; padding:15px 0px 0px 0px; border-bottom-width:0px;">
       
      <label class="title" style="align:center">${eventDto.event_name}</label>
</div>
</div><br/>

<div align="center">
 <img src="${root}/css/event/images/${eventDto.event_file_name}" title="${eventDto.event_name}" width="400" height="200"/>
</div>

<div align="center">
       <span class="content" style="height:230px;">
        <textarea rows="14" cols="67" disabled="disabled">${eventDto.event_Content}</textarea>
        <input type="hidden" name="event_Content" value="${eventDto.event_Content}"/>
       </span>
</div>
<div align="center">
<c:if test="${id=='admin'}">
<div class="line" style="width:598px; border-width:2px; text-align:center;">
				<input type="button" value="이벤트 수정" onclick="updateFun('${root}', '${eventDto.event_bunho}')"/>
				<input type="button" value="이벤트 삭제" onclick="deleteFun('${root}', '${eventDto.event_bunho}')"/>
         </div>
 </c:if>        
</div>
</div>
</div>
<jsp:include page="../main-bottom.jsp"/>
	<br/><br/>
</body>
</html>