<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 등록</title>
</head>
<body>

<form class="form_style" action="${root}/event/eventWrite.do" method="post" onsubmit="" enctype="multipart/form-data">

 <div align="left">
   <label class="title">이벤트 등록</label>
   
   <div id="name">
     <div class="line">
       <label class="title">이벤트이름</label>
       <span class="content">
          <input type="text" name="eventname"/>
       </span>
     </div>
   </div>
 </div>
</form>
</body>
</html>