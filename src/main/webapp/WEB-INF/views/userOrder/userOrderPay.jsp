<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../main-top.jsp" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${root}/script/jquery.js"></script>
<script type="text/javascript" src="${root}/script/userOrder/script.js"></script>
<script type="text/javascript">
	$(function() {
		$("#bank").hide();
		$("#phone").hide();

		$("#c").click(function() {
			$("#bank").hide();
			$("#phone").hide();
			$("#card").show();
		});

		$("#b").click(function() {
			$("#card").hide();
			$("#phone").hide();
			$("#bank").show();
		});

		$("#p").click(function() {
			$("#card").hide();
			$("#bank").hide();
			$("#phone").show();
		});
	});

	$(function() {
		$("#new").hide();

		$("#n").click(function() {
			$("#old").hide();
			$("#new").show();
		});

		$("#o").click(function() {
			$("#new").hide();
			$("#old").show();
		});
	});

	function authPhone() {
		alert("휴대폰 인증이 정상적으로 처리되었습니다.");
		$(function() {
			$("#authPhoneNum").attr("disabled", true);
		});
	}
</script>
<title>GoBookGoBook</title>
</head>
<body>
<body>

	<c:if test="${check >0 }">
		<script type="text/javascript">
			alert("결제가 정상처리 되었습니다.");
			location.href="${root}/myPage/myPageOrderList.do";
		</script>
	</c:if>
	
	<c:if test="${check ==0 }">
		<script type="text/javascript">
			alert("주문결제에 실패했습니다.");
			location.href="${root}/userOrder/userOrderList.do";
		</script>
	</c:if>
</body>
</html>