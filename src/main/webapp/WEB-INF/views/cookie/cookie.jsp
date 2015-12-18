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
<!-- <script type="text/javascript">
	 function cookie(root){
		 var cookies = document.cookie;
		   cookiearr  = cookies.split(';');
		   for(var i=0; i<cookiearr.length; i++){
		      name = cookiearr[i].split('=')[0];
		      value = cookiearr[i].split('=')[1];
		      alert("키 : " + name + " , 값 : " + value);
		   }
	}
</script> -->
<script type="text/javascript">
	function delCookie(root){
		var url=root+"/storeInfo/delCookie.do";
		location.href=url;
	}
</script>
<script type="text/javascript" src="${root}/script/userBook/script.js"></script>
</head>
<body>
	<c:if test="${id!=null}">
		<div style="position: fixed; width: 102px; height: auto; border:10px solid red; margin-left: 90%; margin-top : 10%; ">
			<div align="center" style="border:2px solid black; background-color: lime;">최근본 도서</div>
			<div align="center" style="border:0px solid black; background-color: aqua;">
			<%if(cookies!=null){
				if(cookies.length>=3){
					for(int i=cookies.length-1;i>=cookies.length-3;i--){
						if(cookies[i].getName().equals("book_num") || cookies[i].getName().equalsIgnoreCase("JSESSIONID")) continue;%>
			 			<a name="coo" href="javascript:userBookRead('${root}', '<%=cookies[i].getName() %>')"><img style="width:99px; height:100px; max-height: 100%; max-width:100%;" src="#"/></a>
			 			<div><%=cookies[i].getName() %></div>
					<%}}else if(cookies.length>=2){
						for(int i=cookies.length-1;i>=cookies.length-2;i--){
						if(cookies[i].getName().equals("book_num") || cookies[i].getName().equalsIgnoreCase("JSESSIONID")) continue;%>
			 			<a name="coo" href="javascript:userBookRead('${root}', '<%=cookies[i].getName() %>')"><img style="width:99px; height:100px; max-height: 100%; max-width:100%;" src="#"/></a>
			 			<div><%=cookies[i].getName() %></div>
					<%}}else if(cookies.length>=1){
						for(int i=cookies.length-1;i>=cookies.length-1;i--){
				 		if(cookies[i].getName().equals("book_num") || cookies[i].getName().equalsIgnoreCase("JSESSIONID")) continue;%>
			 			<a name="coo" href="javascript:userBookRead('${root}', '<%=cookies[i].getName() %>')"><img style="width:99px; height:100px; max-height: 100%; max-width:100%;" src="#"/></a>
			 			<div><%=cookies[i].getName() %></div>
					<%}}}%>
			<%-- <div><input type="button" name="del_cookie" value="쿠키삭제" onclick="javascript:delCookie('${root}')"/></div> --%>
			</div>
		</div>
	</c:if>
</body>
</html>
<%-- ${root}/img/storeInfo/<%=cookies[i].getValue() %> --%>