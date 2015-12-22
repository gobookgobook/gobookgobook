<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>GoBookGoBook</title>
<link rel="Shortcut Icon" href="${root}/images/favicon.ico"/>
<link href="${root}/css/member/style.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="${root}/script/member/script.js"></script>
<style type="text/css">
A:link    {color:#666666 ;text-decoration:none;} 
A:visited {color:#666666 ;text-decoration:none;}
A:active  {color:#b1b1b1 ;text-decoration:none;}
A:hover  {color:#b1b1b1 ;text-decoration: underline;}
</style>
</head>
<body style="margin: -3px; overflow-x:hidden;">
	<table style="width: 480; height: 240; border: 0; cellpadding: 0; cellspacing: 0;">
		<tbody>
			<tr>
				<td height="40"><img src="${root}/images/member/title_pop06.gif" width="480" height="40"></td>
			</tr>
			<tr>
				<td align="center">
					<table style="width: 300; height: 80; border: 0; cellpadding: 0; cellspacing: 0;">
						<tbody>
							<tr>
								<td align="center">
									<img src="${root}/images/member/title_pop05.gif" width="277" height="20">
								</td>
							</tr>
							<tr>
								<td height="62" width="300" background="${root}/images/member/pop_id.jpg">
									<table style="">
										<tbody>
											<tr>
												<td width="99">&nbsp;</td>
												<td width="201" height="16" class="fontsize"><span style="font-size: 12px">보기: 우면동, 서초1동, 구례읍</span></td>
											</tr>
											
											<tr>
												<td>&nbsp;</td>
												
												<td>
													<input id="reAddr" name="id" type="text" size="16"> 
													<img src="${root}/images/member/search_pop.gif" width="41"	height="18" border="0" onclick="javascript:reAddr('${root}')" style="cursor: pointer;">
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
								<table>
									<c:choose>
										<c:when test="${zipcode==null || zipcode.size()==0}">
											<tr>
												<td><span style="font-size: 12px"> 찾고자 하는 동이 없습니다. 다시 확인해 주십시오.</span></td>
											</tr>
										</c:when>
										
										<c:when test="${zipcode.size() >0 }">
											<tr>
												<td><span style="font-size: 12px">아래의 우편번호를 클릭하세요.</span></td>
											</tr>
											<c:forEach var="zipList" items="${zipcode}">
												<tr style="">
													<td>
														<span style="font-size: 12px">
															<a href="javascript:sendAddress('${zipList.zipcode }','${zipList.sido }','${zipList.gugun }','${zipList.dong }','${zipList.ri }','${zipList.bunji }')">
																<span style="color:red;">[${zipList.zipcode }]&nbsp;</span>
																${zipList.sido }
																${zipList.gugun }
																${zipList.dong }
																${zipList.ri }
																${zipList.bunji }
															</a>
														</span><br/>
													</td>
												</tr>
											</c:forEach>
										</c:when>
									</c:choose>
								</table>
							</td>
						</tbody>
					</table></td>
			</tr>
			<tr>
				<td height="26" align="center" valign="top" background="${root}/images/member/pop_bottom.jpg">&nbsp;</td>
			</tr>
			<tr>
				<td height="24" align="right"  background="${root}/images/member/pop_bottom2.jpg" class="close">
					<img src="${root}/images/member/close2.gif" style="cursor: pointer;" hspace="5" border="0" onclick="javascript:close()">
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>