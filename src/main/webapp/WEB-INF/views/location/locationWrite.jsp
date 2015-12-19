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
	<div id="contents" style="background:white; border:0px solid black">
		<div id="wrap">
			<div style="background-color: #41AF39;margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
				<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;지점 관리</b>
			</div>
			
			<div align="left" style="width: 110px;float: left">
				<jsp:include page="locationConNav.jsp"/>
			</div>
			
			<h1 style="margin-left:20px">지점등록</h1>
		
			<div align="center" class="container" style="width:835px;padding:0px;margin-left:130px">
				<form class="form_style" name="locationForm" action="${root}/location/locationWrite.do" 
					method="post" onsubmit="return locationWriteForm(this)">
					<div class="line">
						<label class="title">지점명</label>
						<span class="content">
							*<input type="text" value="꼬북꼬북" disabled="disabled" />	
						</span>
				  	</div>
					
					<div class="line">
						<label class="title">지점 주소</label>
						<span class="content">
							*<input type="text" name="location_address" size="48"/>
						</span>
					</div>
					
					<div class="line">
						<label class="title">지점장이름</label>
						<span class="content">
							*<input type="text" name="location_admin" size="48" />
						</span>
					</div>
					
					<div class="line">
						<label class="title">지점 전화번호</label>
						<span class="content">
							*<input type="text" name="location_phone" size="48" />
						</span>
					</div>
					
					<div class="line" style="width:591px; border-width:2px; border-color:#B3D667; text-align:center;">
						<input type="submit" class="btn btn-success btn-xs" value="매장등록" />
						<input type="reset" class="btn btn-success btn-xs" value="취소" />
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>