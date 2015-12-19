<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${check >0}">
		<p>
			결제가 정상처리 되었습니다.
		</p>
		
		<input type="button" value="주문내역으로 이동" onclick="location.href='${root}/myPage/myPageOrderList.do'"/>
		<input type="button" value="메인화면으로 이동" onclick="location.href='${root}/member/goBookMain.do'"/>
	</c:if>
	
	<c:if test="${check == 0 }">
		<script type="text/javascript">
			alert("주문결제에 실패했습니다.");
			location.href="${root}/userOrder/userOrderList.do";
		</script>
	</c:if>
</body>
</html>