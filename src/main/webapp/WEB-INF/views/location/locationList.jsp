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
<script type="text/javascript" src="${root}/script/location/script.js"></script>

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
				<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;> 지점 관리</b>
			</div>
			
			<div align="left" style="width: 110px;float: left">
				<jsp:include page="locationConNav.jsp"/>
			</div>
			
			<div align="center"><b style="font-size:18px">지점 목록</b></div>
			<br/><br/>
			<div align="center"><div id="map"></div></div>
			<br/><br/>
			<div align="center" class="container" style="width:835px;padding:0px;margin-left:130px">
				<c:if test="${count==0}">
					<table border="1" class="table table-bordered">
						<tr class="success">
							<td width="530" align="center">등록된 지점이 없습니다.</td>
						</tr>
					</table>
				</c:if>
				
				<c:if test="${count > 0}">
					<table border="1" class="table table-bordered">
						<tr class="success" style="color:#1DDB16">
							<td align="center" style="font-size:14px;">지점명</td>
							<td align="center" style="font-size:14px;">지점주소</td>
							<td align="center" style="font-size:14px;">지점장</td>
							<td align="center" style="font-size:14px;">전화번호</td>
							<td align="center" style="font-size:14px;">수정&삭제</td>
						</tr>
						
						<c:set var="i" value="0"/>
						<c:forEach var="location" items="${locationList}">
							<tr class="success">
								<td align="center" style="font-size:14px;">꼬북꼬북</td>
								<td align="center" style="font-size:14px;">${location.location_address}</td>
								<td align="center" style="font-size:14px;">${location.location_admin}</td>
								<td align="center" style="font-size:14px;">${location.location_phone}</td>
								<td align="center" style="font-size:14px;">
									<input type="button" class="btn btn-success btn-xs" value="수정" style="font-size:14px;" onclick="javascript:location.href='${root}/location/locationUpdate.do?locationNum=${location.location_num}'"/>
									<input type="button" class="btn btn-success btn-xs" value="삭제" style="font-size:14px;" onclick="javascript:deleteCheck('${root}','${location.location_num}')"/>
								</td>
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