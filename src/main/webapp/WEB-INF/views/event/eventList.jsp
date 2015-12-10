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
</head>
<body>
<jsp:include page="../member/menu.jsp"/>
   <br/><br/>
   
     <div align="center">
        <div id="event_one">
        <c:forEach var="eventDto" items="${eventList}">
           <div id="event_id">
           <a href="javascript:readFun('${root}','${eventDto.event_bunho}')">
            <img src="http://localhost:8181/gobook/css/event/images/${eventDto.event_file_name}" title="${eventDto.event_name}" width="300" height="300"/>
           </a>
            </div>
            </c:forEach>
        </div>
        
	</div>
</body>
</html>