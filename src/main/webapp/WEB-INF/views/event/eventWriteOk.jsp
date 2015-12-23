<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../admin-top.jsp"/>
</head>
<body>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:if test="${check > 0}">
 <script type="text/javascript">
   alert("게시판 글이 작성 되었습니다.");
   location.href="${root}/event/eventList.do";
 </script>
 </c:if>
 
  <c:if test="${check == 0}">
 <script type="text/javascript">
   alert("게시판 글이 작성 되지 않았습니다.");
   location.href="${root}/event/eventWrite.do";
 </script>
 </c:if>

</body>
</html>