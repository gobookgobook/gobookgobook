<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${root}/css/location/style.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="${root}/script/location/script.js"></script>
<script type="text/javascript" src="${root}/script/jquery.js"></script>
<script type="text/javascript" src="${root}/script/location/registeMapScript.js"></script>
</head>
<body>
	<jsp:include page="../member/menu.jsp"/>
	<br/><br/>
	<div>
		<font size="2"><b>매장 등록</b></font>
	</div>

	<div align="center">
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
			
			<div class="line" style="width:591px; border-width:2px; text-align:center;">
				<input type="submit" value="매장등록" />
				<input type="reset" value="취소" />
			</div>
			<div id="map"></div>
		</form>
	</div>
</body>
</html>