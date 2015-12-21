<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<jsp:include page="../admin-top.jsp"/>
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
<style>
.ui-datepicker{ font-size: 13px; width: 270px; }
.ui-datepicker select.ui-datepicker-month{ width:40%; font-size: 11px;}
.ui-datepicker select.ui-datepicker-year{ width:40%; font-size: 11px; }
</style>
</head>
<body>

      <div id="contents" style="height:600px; background:white; border:0px solid black">     
             <form class="form_style" action="${root}/event/eventWrite.do" method="post" onsubmit="return eventForm(this)" enctype="multipart/form-data"> 
                <c:if test="${id=='admin'}">
                  <div style="margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
			          <b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;> 이벤트 관리</b>
		         </div>
		       
		       <div align="left" style="width: 110px;float: left;">
			      <jsp:include page="eventConNav.jsp"/>
		        </div>
         <br/>
			<div align="center"><b style="font-size:18px">이벤트 등록</b></div>
         <br/>
 <div align="center">  
     <div class="line">
      <div id="name" style="border:0px solid red;">
       <label class="title">이벤트이름</label>
       <span class="content">
          <input type="text" name="event_name"/><br/><br/>
       </span>
       </div>
       <label class="title">이벤트기간</label>
       
       <input type="text" id="date1" name="event_start_period"/>
       ~
       <input type="text" id="date2" name="event_end_period"/>
       <br/><br/> 
      
      <div class="line"> 
       <label class="title">이벤트내용</label><br/><br/><br/>
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
</c:if> 
</form>
	</div>
	<jsp:include page="../main-bottom.jsp"/>
	<br/><br/>
	
</body>
</html>