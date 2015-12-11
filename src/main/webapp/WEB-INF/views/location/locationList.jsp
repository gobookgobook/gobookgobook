<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
					<td width="250" align="center">지점명</td>
					<td width="250" align="center">지점주소</td>
					<td width="250" align="center">전화번호</td>
				</tr>
				
				<c:forEach var="location" items="${locationList}">
					<tr>
						<td>꼬부꼬북</td>
						<td>
							<a href="${root}/location/locationRead.do?location_num='${location.location_num}'">${location.location_address1}</a>
						</td>
						<td>${location.location_phone}</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		
		<input type="button" value="지점등록" onclick="javascript:location.href='${root}/location/locationWrite.do'"/>
	</div>
</body>
</html>