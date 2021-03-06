<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>GoBookGoBook</title>
<link rel="stylesheet" type="text/css" href="${root}/css/memberManage/memberManage.css"/>
<script type="text/javascript" src="${root}/script/memberManage/memberManager.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<jsp:include page="../admin-top.jsp"/>
</head>
<body>
<div id="contents" style="height:300px; background:white; border:0px solid black; position: static;">	
	<c:if test="${id=='admin'}">
		<div style="margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
			<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;> 회원 관리</b>
		</div>
		
		<div align="left" style="width: 120px;float: left;">
			<jsp:include page="menu.jsp"/>
		</div>
		
		<br/>
			<div align="center"><b style="font-size:18px">관리자 정보 수정</b></div>
		<br/>
		<form class="memberMnager" name="managerForm" action="${root}/memberManager/memberManagerUpdateOk.do" method="post" onsubmit="">
			<input type="hidden" name="member_id" value="${memberDto.member_id}">
			
			<table class="table table-bordered" style=" width:800px; margin: 0px auto;">
				 <tbody>
			    <tr>
			    <th style="background:#dff0d8;">관리자 아이디</th>
			     <td colspan="3">
			       <input type="text" name="id" value="${memberDto.member_id}" disabled="disabled"/>
			     </td>
			    </tr>
			   
			    <tr>
			    <th style="background:#dff0d8;">비밀번호</th>
			     <td colspan="3">
			       <input type="password" name="member_password" value="${memberDto.member_password}"/>
			     </td>
			    </tr>
			    
			    <tr>
			    <th style="background:#dff0d8;">관리자 이름</th>
			     <td colspan="3">
			       <input type="text" name="member_name" value="${memberDto.member_name}"/>
			     </td>
			    </tr>
			    
			    <tr>
			    <th style="background:#dff0d8;">전화번호</th>
			     <td colspan="3">
			       <input type="text" name="member_phone" value="${memberDto.member_phone}"/>
			     </td>
			    </tr>
		</tbody>
		</table>
		<input type="hidden" name="member_zipcode" value="${memberDto.member_zipcode}" />
		<input type="hidden" name="member_address1" value="${memberDto.member_address1}" />
		<input type="hidden" name="member_address2" value="${memberDto.member_address2}"/>
		<div align="center" style="margin-top: 10px; margin-left: 130px;">
			<input type="submit" value="수정" style="width: 60px; height: 30px;"/>
			<input type="reset" value="취소" style="width: 60px; height: 30px;"/>
		</div>
	</form>	
	</c:if>
</div>
<jsp:include page="../main-bottom.jsp"/>
</body>
</html>