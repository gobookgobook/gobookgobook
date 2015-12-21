<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<jsp:include page="../main-top.jsp"/>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/script/location/script.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/help/style.css"/>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<script type="text/javascript" src="${root}/script/jquery.js"></script>
<script type="text/javascript" src="${root}/script/location/listMapScript.js"></script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?sensor=true&signed_in=true">
</script>
<style type="text/css">
	#map {
		height: 600px;
		width: 600px;
	}
</style>
</head>
<body onload="initMap('${count}')">
<div id="contents" style="height:100%; background:white; border:0px solid black;position: static">
	<div id="wrap">
		<div style="margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
			<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;> 고객센터</b>
		</div>
		
		<div align="left" style="width: 110px;float: left">
			<jsp:include page="userCategory.jsp"/>
		</div>
		
		<br/>
			<div align="center"><b style="font-size:18px">지점 확인</b></div>
		<br/>
		
		<div align="center"><div id="map"></div></div>
		<br/><br/>
		<div align="center">
			<c:if test="${count==0}">
				<div class="container" style="width:600px;padding:0px;margin-left:257px">
					<table class="table table-bordered">
						<thead>
							<tr style="color:white;background-color:#37415a">
								<th style="text-align:center">지점명</th>
								<th style="text-align:center">지점주소</th>
								<th style="text-align:center">지점장</th>
								<th style="text-align:center">전화번호</th>
							</tr>
						</thead>
						<tbody id="listAllTd"></tbody>
					</table>
				</div>
				<div align="center" style="padding-bottom:25px; border-bottom:1px solid #DDDDDD;margin-left:120px">지점이 없습니다.<br/>지점이 등록 된 후에 지점을 확인 하실 수 있습니다.</div>
				<!-- <table>
					<tr style="color:white;background-color:#37415a">
						<td width="100" align="center">지점명</td>
						<td width="500" align="center">지점주소</td>
						<td width="100" align="center">지점장</td>
						<td width="150" align="center">전화번호</td>
					</tr>
					
					<tr>
						<td width="530" style="text-align: center">게시판에 저장된 글이 없습니다.</td>
					</tr>
				</table> -->
			</c:if>
			
			<c:if test="${count > 0}">
				<table border="1">
					<tr>
						<td width="100" align="center">지점명</td>
						<td width="500" align="center">지점주소</td>
						<td width="100" align="center">지점장</td>
						<td width="150" align="center">전화번호</td>
					</tr>
					
					<c:set var="i" value="0"/>
					<c:forEach var="location" items="${locationList}">
						<tr>
							<td align="center">꼬북꼬북</td>
							<td align="center">${location.location_address}</td>
							<td align="center">${location.location_admin}</td>
							<td align="center">${location.location_phone}</td>
						</tr>
						
						<input type="hidden" value="${location.location_address}" id="add_${i}"/>
						<c:set var="i" value="${i+1}"/>
						
					</c:forEach>
				</table>
			</c:if>
		</div>
	</div>
</div>
<jsp:include page="../main-bottom.jsp"/>	
</body>
</html>