<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/js/memberManage/memberManager.js"></script>
</head>
<body>
	<form action="${root}/memberManage/managerZipcode.do" method="get">
		<div style="text-align: center;">
			<input type="text" name="dong"/>
			<input type="submit" value="검색"/>
		</div>
		<div align="center">
		<c:choose>
			<c:when test="${zipcode.size()==0 || zipcode==null}">
				<div>
					검색한 결과가 없습니다.
				</div>
			</c:when>
			
			<c:when test="${zipcode.size() > 0}">
				<div>
				<div>
					아래의 우편번호를 클릭하세요
				</div>
				
				<c:forEach var="zipList" items="${zipcode}">
					<div>
						<a href="javascript:sendAddress('${zipList.zipcode}', '${zipList.sido}', '${zipList.gugun}', '${zipList.dong}', '${zipList.ri}', '${zipList.bunji}')">
							${zipList.zipcode}
							${zipList.sido}
							${zipList.gugun}
							${zipList.dong}
							${zipList.ri}
							${zipList.bunji}
						</a>
					</div>
				</c:forEach>
				</div>
			</c:when>
		</c:choose>
	</div>
	<div align="center">
		<a href="javascript:close()">닫기</a>
	</div>
	</form>
</body>
</html>