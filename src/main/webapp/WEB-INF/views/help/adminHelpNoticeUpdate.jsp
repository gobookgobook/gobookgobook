<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<jsp:include page="../admin-top.jsp"/>
<meta charset="UTF-8">
<title>공지사항 수정</title>
</head>
<body>
	<form action="${root}/help/adminHelpNoticeUpdate.do" method="post" onsubmit="return adminHelpNoticeWrite(this)">
			<div>
				<input type="hidden" name="helpnotice_num" value="${helpNoticeDto.helpnotice_num}"/>
				<label class="title">제목</label>
			<div>
				<table>
					<tr>
						<td><fmt:formatDate value="${helpNoticeDto.helpnotice_writeDate}" pattern="yyyy-MM-dd"/></td>
					</tr>
				</table>
			</div>
					<table>
						<tr>
							<td>
								<span><input type="text" size="50" name="helpnotice_subject" value="${helpNoticeDto.helpnotice_subject}"/></span>
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
								<textarea rows="14" cols="67" name="helpnotice_content">${helpNoticeDto.helpnotice_content}</textarea>
								</span>
							</td>
						</tr>
					</table>
			</div><br/><br/>
			
			<div>
				<input type="submit" value="공지사항 수정"/>
			</div>
		</form>
</body>
</html>
