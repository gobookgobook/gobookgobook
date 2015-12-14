<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
</head>
<body>
	<h2>공지사항</h2>
	<hr><br/>
 	<form action="${root}/help/adminHelpNoticeWrite.do" method="post" onsubmit="return adminHelpNoticeWrite(this)">
			<div>
				<label class="title">제목</label>
					<table>
						<tr>
							<td>
								<span><input type="text" size="50" name="helpnotice_subject"/></span>
							</td>
						</tr>
					</table>
			</div><br/><br/>
		
			<div style="height:230px;">
				<label>내용</label>
					
					<table>
						<tr>
							<td>
								<span style="height:230px;">
								<textarea rows="14" cols="67" name="helpnotice_content"></textarea>
								</span>
							</td>
						</tr>
					</table>
			</div><br/><br/>
			
			<div>
				<table>
					<tr>
						<td>${help.helpnotice_writeDate}</td>
					</tr>
				</table>
			</div>
			<div>
				<input type="submit" value="공지사항 등록"/>
			</div>
		</form>
</body>
</html>
