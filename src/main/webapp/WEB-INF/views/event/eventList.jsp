<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 리스트</title>
<link href="${root}/css/event/style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
     function readFun(root,event_bunho){
    	 var url=root + "/event/eventRead.do?event_bunho=" +event_bunho;
    	 //alert(url);
    	 location.href=url;
   }
  </script>
<jsp:include page="../admin-top.jsp"/>
</head>
<body>
   <br/><br/>
<div id="contents" style="height:450px; background:white; border:1px solid black; position:absolute;  left:172px;" ><br/><br/><br/><br/>   
<div align="right">
<c:if test="${id=='admin'}">
<div style="width:598px; height:10px; text-align:right; ">
			<a href="${root}/event/eventWrite.do">이벤트 등록</a>
</div>
</c:if>
</div>
   
     <div align="center">
        <div id="event_one">
        <c:forEach var="eventDto" items="${eventList}">
           <div id="event_id">
           <a href="javascript:readFun('${root}','${eventDto.event_bunho}')">
            <img src="http://localhost:8181/gobook/css/event/images/${eventDto.event_file_name}" title="${eventDto.event_name}" width="300" height="100"/>
           </a>
            
            <a href="javascript:readFun('${root}','${eventDto.event_bunho}')">${eventDto.event_name}</a> 
            </div>
            </c:forEach>
        </div>
    </div>    
	</div>
<jsp:include page="../main-bottom.jsp"/>
	<br/><br/>			
</body>
</html>