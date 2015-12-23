<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../admin-top.jsp"/>
<title>GoBookGoBook</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${root}/script/sales/jquery.js"></script>
<script type="text/javascript" src="${root}/script/sales/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/script/sales/jquery-ui.css"/>
<script type="text/javascript" src="${root}/script/memberManage/managerCoupon.js"></script>
</head>
<body>
	<c:if test="${value>0}">
		<script type="text/javascript">
		alert("쿠폰이 회원들에게 발급되었습니다.");
		location.href="${root}/memberManager/memberManageCouponList.do";
		</script>
	</c:if>
	<c:if test="${value <= 0}">
		<script type="text/javascript">
		alert("쿠폰이 발급되지 않았습니다.");
		location.href="${root}/memberManager/memberManageCouponRead.do?mcoupon_num="+${mcoupon_num};
		</script>
	</c:if>
	<c:if test="${userCouponDto.size() > 0 }">
		<script type="text/javascript">
		alert("이미 뿌림");
		location.href="${root}/memberManager/memberManageCouponList.do";
		</script>
	</c:if>
</body>
</html>