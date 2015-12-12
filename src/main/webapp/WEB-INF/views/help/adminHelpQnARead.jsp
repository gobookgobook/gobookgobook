<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>QnA읽기</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link href="${root}/css/help/style.css" type="text/css" rel="stylesheet">

<script type="text/javascript">
	function deleteFun(root, helpqna_num){
		var url=root+"/help/adminHelpQnADelete.do?helpqna_num="+helpqna_num;
		//alert(url);
		location.href=url;
	}
	
	function updateFun(root, helpqna_num, pageNumber){
		var url=root+"/help/adminHelpQnAUpdate.do?helpqna_num="+helpqna_num+"&pageNumber="+pageNumber;
		alert(url);
		location.href=url;
	}
</script>
</head>
<body>
	<div>
		<div>	
			<span>${HelpQnADto.helpqna_content}</span>
		</div>
		<input type="button" value="글삭제" onclick="deleteFun('${root}', '${HelpQnADto.helpqna_num}')"/>
		<input type="button" value="글수정" onclick="updateFun('${root}', '${HelpQnADto.helpqna_num}', '${pageNumber}')"/>
	</div>
</body>
</html>
