<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="javax.servlet.http.Cookie"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.gobook.userbook.service.UserBookService" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	Cookie cookies[]=null;
	if(request.getCookies()!=null){
		cookies=request.getCookies();
		for(int i=0;i<cookies.length;i++){
			String rslt=UserBookService.euckr_decode(cookies[i].getValue());
			cookies[i].setValue(rslt);
		}
	}
%>
<script type="text/javascript" src="${root}/script/cookie/cookie.js"></script>
<link href="${root}/css/cookie/cookie.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div id="quick">
   <h3><span>최근 본 도서</span></h3>
   	<ul>
		<%if(cookies!=null){
			if(cookies.length>=3){
				for(int i=cookies.length-1;i>=cookies.length-3;i--){
					if(cookies[i].getName().equals("book_num") || cookies[i].getName().equalsIgnoreCase("JSESSIONID")) continue;%>
		 			<li><img src="http://localhost:8181/gobook/css/book/images/<%=cookies[i].getValue()%>" alt="" onclick="javascript:userBookRead('${root}', '<%=cookies[i].getName() %>')"/></li>
				<%}}else if(cookies.length>=2){
					for(int i=cookies.length-1;i>=cookies.length-2;i--){
					if(cookies[i].getName().equals("book_num") || cookies[i].getName().equalsIgnoreCase("JSESSIONID")) continue;%>
		 			<li><img src="http://localhost:8181/gobook/css/book/images/<%=cookies[i].getValue()%>" alt="" onclick="javascript:userBookRead('${root}', '<%=cookies[i].getName() %>')"/></li>
				<%}}else if(cookies.length>=1){
					for(int i=cookies.length-1;i>=cookies.length-1;i--){
			 		if(cookies[i].getName().equals("book_num") || cookies[i].getName().equalsIgnoreCase("JSESSIONID")) continue;%>
		 			<li><img src="http://localhost:8181/gobook/css/book/images/<%=cookies[i].getValue()%>" alt="" onclick="javascript:userBookRead('${root}', '<%=cookies[i].getName() %>')"/></li>
				<%}}}%>
		<li><a href="#"><img src="${root}/images/quick_top_btn.png" alt="상단으로 이동" /></a></li>
	</ul>
</div>
</body>
</html>