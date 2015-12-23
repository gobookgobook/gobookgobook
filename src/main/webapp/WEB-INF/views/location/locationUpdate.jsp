<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<jsp:include page="../admin-top.jsp"/>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${root}/css/location/style.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="${root}/script/location/script.js"></script>
<script type="text/javascript" src="${root}/script/jquery.js"></script>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
	<div id="contents" style="height:40%; background:white; border:0px solid black;position: static">
		<div id="wrap">
			<div style="margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
				<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;> 지점 관리</b>
			</div>
			
			<div align="left" style="width: 110px;float: left">
				<jsp:include page="locationConNav.jsp"/>
			</div>
			
			<div align="center" style="width:1040px"><b style="font-size:18px">지점 수정</b></div>
		    <br/>
		    
		    <div align="center" class="container" style="width:960px;height:250px;padding:0px;margin-left:40px;border:0px solid red;">
				<form style="margin-left:130px" name="locationForm" action="${root}/location/locationUpdate.do" 
					method="post" onsubmit="return locationWriteForm(this)">
					<div>
						<label class="title" style="width:200px;font-size:14px;height:32px; background-color:#dff0d8">지점명</label>
					    <input type="text" class="content" value="꼬북꼬북" style="width:610px;font-size:14px;height:32px" disabled="disabled" />	
						<input type="hidden" name="location_num" value="${locationDto.location_num}"/>
				  	</div>
					
					<div style="height: 30px">
						<label class="title" style="width:200px;height:32px;font-size:14px; background-color:#dff0d8">지점 주소</label>
						<input class="content" type="text" size="50" name="location_address" style="width:610px;font-size:14px;height:32px" value="${locationDto.location_address}"/>
					</div>
					
					<div style="height: 30px">
						<label class="title" style="width:200px;height:32px;font-size:14px; background-color:#dff0d8">지점장 이름</label>
						<input class="content" type="text" size="50" name="location_admin" style="width:610px;font-size:14px;height:32px" value="${locationDto.location_admin}"/>
					</div>
					
					<div style="height: 30px">
						<label class="title" style="border-bottom-width:2px; border-bottom-color:#dddddd;width:200px;height:32px;font-size:14px; background-color:#dff0d8">지점 전화번호</label>
						<input class="content" type="text" size="50" name="location_phone" style="border-bottom-width:2px; border-bottom-color:#dddddd;width:610px;font-size:14px;height:32px" value="${locationDto.location_phone}"/>
					</div>
					
					<div class="line" style="width:810px;text-align:center; margin-top:30px;">
						<input type="submit" class="btn btn-success btn-xs" value="지점수정" style="font-size:14px;"/>
						<input type="reset" class="btn btn-success btn-xs" value="취소" style="font-size:14px;" />
					</div>
				</form>
			</div>
		
			<%-- <div align="center" class="container" style="width:1000px;height:250px;padding:0px;margin-left:-20px">
				<form class="form_style" name="locationForm" action="${root}/location/locationUpdate.do" 
					method="post" onsubmit="return locationWriteForm(this)">
					<div class="line">
						<label class="title" style="width:200px;font-size:14px;height:32px; background-color:#dff0d8">지점명</label>
						<span class="content">
							<input type="text" value="꼬북꼬북" style="width:610px;font-size:14px;height:32px" disabled="disabled" />	
							<input type="hidden" name="location_num" value="${locationDto.location_num}"/>
						</span>
				  	</div>
					
					<div class="line">
						<label class="title">지점 주소</label>
						<span class="content">
							*<input type="text" name="location_address" value="${locationDto.location_address}" size="48"/>
						</span>
					</div>
					
					<div class="line">
						<label class="title">지점장이름</label>
						<span class="content">
							*<input type="text" name="location_admin" value="${locationDto.location_admin}" size="48" />
						</span>
					</div>
					
					<div class="line">
						<label class="title">지점 전화번호</label>
						<span class="content">
							*<input type="text" name="location_phone" value="${locationDto.location_phone}" size="48" />
						</span>
					</div>
					
					<div class="line" style="width:591px; border-width:2px; border-color:#B3D667; text-align:center;">
						<input type="submit" class="btn btn-success btn-xs" value="지점수정" />
						<input type="reset" class="btn btn-success btn-xs" value="취소" />
					</div>
				</form>
			</div> --%>
		</div>
	</div>
	<jsp:include page="../main-bottom.jsp"/>
</body>
</html>