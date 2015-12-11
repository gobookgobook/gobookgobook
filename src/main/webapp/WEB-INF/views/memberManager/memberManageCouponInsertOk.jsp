<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${value >0 }">
		<script type="text/javascript">
			alert("쿠폰 생성에 성공했습니다.");
			location.href="${root}/memberManager/memberManageCouponInsert.do";
		</script>
	</c:if>
	
	<c:if test="${value ==null }">
		<script type="text/javascript">
			alert("정보를 다시 입력해주세요.");
			location.href="${root}/memberManager/memberManageCouponInsert.do";
		</script>
	</c:if>
</body>
</html>