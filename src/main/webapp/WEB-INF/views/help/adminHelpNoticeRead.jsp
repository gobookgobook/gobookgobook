<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 읽기</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script type="text/javascript">
	function deleteFun(root, helpnotice_num){
		var url=root+"/help/adminHelpNoticeDelete.do?helpnotice_num="+helpnotice_num;
		alert("url:"+ url);
		location.href=url;
	}
	
	function updateFun(root, helpnotice_num, pageNumber){
		var url=root+"/help/adminHelpNoticeUpdate.do?helpnotice_num="+helpnotice_num +"&pageNumber="+pageNumber;
		alert(url);
		location.href=url;
	}
</script>
</head>
<body>
	<div>
		<div>
			<table>
				<tr>	
					<td>${helpNoticeDto.helpnotice_content}</td>
				</tr>
			</table>
		</div>
		<input type="button" value="글삭제" onclick="deleteFun('${root}', '${helpNoticeDto.helpnotice_num}')"/>
		<input type="button" value="글수정" onclick="updateFun('${root}', '${helpNoticeDto.helpnotice_num}', '${pageNumber}')"/>
		<input type="button" value="목록으로" onclick="location.href='${root}/help/adminHelpNoticeList.do?pageNumber=${pageNumber}'"/>
	</div>
</body>
</html>
