<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
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
<jsp:include page="../member/menu.jsp"/>
   <br/><br/>
   
<div align="right">
<div style="width:598px; height:15px; border-width:2px; text-align:right; padding:15px 0px 0px 0px; border-bottom-width:0px;">
       
       <label class="title"><fmt:formatDate value="${eventDto.event_start_period}"/></label>
       ~
       <label class="title"><fmt:formatDate value="${eventDto.event_end_period}"/></label>
</div>

<div align="left">
<div style="width:598px; height:15px; border-width:2px; text-align:left; padding:15px 0px 0px 0px; border-bottom-width:0px;">
       
      <label class="title">${eventDto.event_name}</label>
</div>
</div>

<div align="center">
 <img src="http://localhost:8181/gobook/css/event/images/${eventDto.event_file_name}" title="${eventDto.event_name}" width="500" height="500"/>
</div>

<div align="center">
       <span class="content" style="height:230px;">
        <textarea rows="14" cols="67" disabled="disabled">${eventDto.event_Content}</textarea>
        <input type="hidden" name="event_Content" value="${eventDto.event_Content}"/>
       </span>
</div>
<div align="center">
<div class="line" style="width:598px; border-width:2px; text-align:center;">
				<input type="button" value="이벤트 수정" onclick="updateFun('${root}', '${eventDto.event_bunho}')"/>
				<input type="button" value="이벤트 삭제" onclick="deleteFun('${root}', '${eventDto.event_bunho}')"/>
         </div>
</div>
</div>
</body>
</html>