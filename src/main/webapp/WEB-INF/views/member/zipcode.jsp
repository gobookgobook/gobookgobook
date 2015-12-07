<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${root}/css/member/style.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="${root}/script/member/script.js"></script>
</head>
<body>
	<form action="${root}/member/zipcode.do" method="post">
		<div align="center">
			<table>
				<tr>
					<td>
						<input type="text" name="dong"/>
						<input type="submit" value="검색"/>
					</td>
				</tr>
			</table>
		</div>
	</form>
	
	<br/>
	<div align="center">
		<table>
			<c:choose>
				<c:when test="${zipcode==null || zipcode.size()==0}">
					<tr>
						<td> 찾고자 하는 동이 없습니다. 다시 확인해 주십시오.</td>
					</tr>
				</c:when>
				
				<c:when test="${zipcode.size() >0 }">
					<tr>
						<td>아래의 우편번호를 클릭하세요.</td>
					</tr>
					<c:forEach var="zipList" items="${zipcode}">
						<tr>
							<td>
								<a href="javascript:sendAddress('${zipList.zipcode }','${zipList.sido }','${zipList.gugun }','${zipList.dong }','${zipList.ri }','${zipList.bunji }')">
									${zipList.zipcode }
									${zipList.sido }
									${zipList.gugun }
									${zipList.dong }
									${zipList.ri }
									${zipList.bunji }
								</a>
							</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
	</div>
	
	<br/>
	<div align="center">
		<a href="javascript:close()">닫기</a>
	</div>
</body>
</html>