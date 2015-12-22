<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="Shortcut Icon" href="${root}/images/favicon.ico"/>
<link href="${root}/css/member/style.css" type="text/css"
	rel="stylesheet" />
<script type="text/javascript" src="${root}/script/member/script.js"></script>
</head>
<body style="margin: -3px; overflow-x:hidden; overflow-y:hidden;">
	<table style="width: 340; height: 240; border: 0; cellpadding: 0; cellspacing: 0;">
		<tbody>
			<tr>
				<td height="40"><img src="${root}/images/member/title_pop01.gif" width="340" height="40"></td>
			</tr>
			<tr>
				<td align="center">
					<table style="width: 300; height: 80; border: 0; cellpadding: 0; cellspacing: 0;">
						<tbody>
							<tr>
								<td align="center">
									<img src="${root}/images/member/title_pop02.gif" width="277" height="20">
								</td>
							</tr>
							<tr>
								<td height="62" width="300" background="${root}/images/member/pop_id.jpg">
									<table style="">
										<tbody>
											<tr>
												<td width="99">&nbsp;</td>
												<td width="201" height="16" class="fontsize">확인하려는 아이디</td>
											</tr>
											
											<tr>
												<td>&nbsp;</td>
												
												<td>
													<input id="reCheck" name="id" type="text" size="16"> 
													<img src="${root}/images/member/search_pop2.gif" width="41"	height="18" border="0" onclick="javascript:reCheckId('${root}')" style="cursor: pointer;">
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table> <br>
					<table style="">
						<tbody>
							<tr>
							<td align="center">
								<c:if test="${check>0 }">
									<c:if test="${length<6 || length>12}">
										<span>아이디는 6자 이상으로 입력해주세요.</span>
									</c:if>
									
									<c:if test="${length>=6 && length<=12}">
										<span style="color: red">${id}</span>
											은 이미 사용중인 아이디 입니다.
									</c:if>
								</c:if>
								
								<c:if test="${check==0 }">
									<c:if test="${length<6  || length>12}">
										<span>아이디는 6자 이상, 12자 이하로 입력해주세요.</span>
									</c:if>
							
									<c:if test="${length>=6  && length<=12}">
										<span style="color: red">${id}</span>
											사용가능한 아이디 입니다.<br />
											사용 하시겠습니까?<br />
										<script type="text/javascript">
											opener.memberForm.id_check.value = "${id}"
										</script>
									</c:if>
								</c:if>
								</td>
							</tr>
							<c:if test="${check==0 }">
								<c:if test="${length>=6  && length<=12}">
									<tr>
										<td align="center"><span class="point">
										<a href="javascript:chooseId()">[사용하기]</a></span></td>
									</tr>
								</c:if>
							</c:if>
						</tbody>
					</table></td>
			</tr>
			<tr>
				<td height="26" align="center" valign="top" background="${root}/images/member/pop_bottom.jpg">&nbsp;</td>
			</tr>
			<tr>
				<td height="24" align="right"  background="${root}/images/member/pop_bottom2.jpg" class="close">
					<img src="${root}/images/member/close2.gif" style="cursor: pointer;" hspace="5" border="0" onclick="javascript:cancel()">
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>