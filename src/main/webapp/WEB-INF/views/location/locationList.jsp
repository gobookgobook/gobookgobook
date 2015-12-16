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
	<div align="center"><div id="map"></div></div>
	<br/><br/>
	<div align="center">
		<table >
			<tr>
				<td width="400" bgcolor="D1DBDB"><a href="${root}/location/locationWrite.do">지점등록</a></td>
			</tr>
		</table>
		
		<c:if test="${count==0}">
			<table border="1">
				<tr>
					<td width="530">게시판에 저장된 글이 없습니다.</td>
				</tr>
			</table>
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
						<td align="center">꼬부꼬북</td>
						<td align="center">${location.location_address}</td>
						<td align="center">${location.location_admin}</td>
						<td align="center">${location.location_phone}</td>
						<td>
							<input type="button" value="수정" onclick="javascript:location.href='${root}/location/locationUpdate.do?locationNum=${location.location_num}'"/>
							<input type="button" value="삭제" onclick="javascript:deleteCheck('${root}','${location.location_num}')"/>
						</td>
					</tr>
					
					<input type="hidden" value="${location.location_address}" id="add_${i}"/>
					<c:set var="i" value="${i+1}"/>
					
				</c:forEach>
			</table>
		</c:if>
		<input type="button" value="지점등록" onclick="javascript:location.href='${root}/location/locationWrite.do'"/>
	</div>
</body>
</html>