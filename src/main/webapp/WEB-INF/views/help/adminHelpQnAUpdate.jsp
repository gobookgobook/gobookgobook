<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>QnA수정</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link href="${root}/css/help/style.css" type="text/css" rel="stylesheet">
</head>
<body>
	
	<form action="${root}/help/adminHelpQnAUpdate.do" method="post" onsubmit="return adminHelpQnAWrite(this)">
			
			<div>
				<input type="hidden" name="helpqna_num" value="${helpQnADto.helpqna_num}"/>
			<table>
				<tr>
					<td><label>질문</label></td>
					<td>
							<span><input type="text" size="50" name="helpqna_subject" value="${helpQnADto.helpqna_subject}"/></span>
					</td>
				</tr>
			</table>
			</div><br/><br/>
		
			<div style="height:230px;">
				<table>
					<tr>
						<td><label>내용</label></td>
						<td>
								<span style="height:230px;">
									<textarea rows="14" cols="67" name="helpqna_content">${helpQnADto.helpqna_content}</textarea>
								</span>
						</td>
					</tr>
				</table>
			</div><br/><br/>
		
			<div>
				<input type="submit" value="QnA수정"/>
			</div>
		</form>
	
</body>
</html>
