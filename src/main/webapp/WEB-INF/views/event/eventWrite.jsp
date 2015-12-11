<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 등록</title>
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

<jsp:include page="../member/menu.jsp"/>
   <br/><br/>
   
<form class="form_style" action="${root}/event/eventWrite.do" method="post" onsubmit="return eventForm(this)" enctype="multipart/form-data">

<div align="right">
<div style="width:598px; height:15px; border-width:2px; text-align:right; padding:15px 0px 0px 0px; border-bottom-width:0px;">
			<a href="${root}/event/eventList.do">이벤트 목록</a>
</div>
</div>
 <div align="center">
   <label class="title">이벤트 등록</label><br/><br/>
   
   <div id="name">
     <div class="line">
       <label class="title">이벤트이름</label>&nbsp;&nbsp;
       <span class="content">
          <input type="text" name="event_name"/><br/><br/>
       </span>
       <label class="title">이벤트기간</label>&nbsp;&nbsp;
       
       <input type="text" id="date1" name="event_start_period"/>
       ~
       <input type="text" id="date2" name="event_end_period"/>
       <br/><br/> 
      
      <div class="line" style="height:230px;"> 
       <label class="title" style="height:230px;">이벤트내용</label><br/>
       <span class="content" style="height:230px;">
        <textarea rows="14" cols="67" name="event_Content"></textarea>
       </span>
      </div><br/>
       <label class="title">이벤트사진</label>
       <span class="content">
         <input type="file" name="event_file"/>
         </span><br/><br/>
      
      <div class="line" style="width:598px; border-width:2px; text-align:center;">
				<input type="submit" value="이벤트 등록"/>
         </div>
     </div>
   </div>
 </div>
</form>
</body>
</html>