<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:set var="date" value="<%=new Date() %>"/>
<fmt:formatDate var="today" value="${date}" pattern="yyyy"/>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${root}/script/member/script.js"></script>
<jsp:include page="../main-top.jsp"/>
</head>
<body>	
<div id="contents" style="height:720px; background:white; position:static; border:0px solid red;"><br/><br/><br/><br/>
  <div align="center">
	<div class="container" style="width:90%; border:0px solid black; margin-top:-60px;">
	  	<br/><br/>
	  	<div align="center"><b style="font-size:18px">회원가입</b></div>
         <br/>
	
	<form class="form-style" role="form" name="memberForm" action="${root}/member/register.do" method="post" onsubmit="return registerForm(this)">
	

	<div id="member_id" style="margin:10px;">
	<input type="text" name="idName" value="아이디" disabled="disabled"  style="background:#37415a; color:white; height:30px;"/>
	<input type="text" name="id_check" size="19" style=height:30px;/>
	<input type="hidden" name="member_id"/>
	<input type="button" value="아이디중복"  style="height:30px;" onclick="idCheck('${root}',memberForm)" />
    </div> 
    
    <div id="member_password"  style="margin:10px;">
    <input type="text" name="passwordName" value="비밀번호" disabled="disabled" style="background:#37415a; color:white; height:30px;"/>
    <input type="password" name="member_password" size="30" style=height:30px;/>
    </div>
    
    <div id="passwordCheck"  style="margin:10px;">
    <input type="text" name="passwordCheckName" value="비밀번호확인" disabled="disabled" style="background:#37415a; color:white; height:30px;"/>
    <input type="password" name="passwordCheck" size="30" style=height:30px;/>
    </div>
    
    <div id="member_name"  style="margin:10px;">
    <input type="text" name="member_nameName" value="이름" disabled="disabled" style="background:#37415a; color:white; height:30px;"/>
    <input type="text" name="member_name" size="30" style=height:30px;/>
    </div>
    
    <div id="zipcodeDisp"  style="margin:10px;">
    <input type="text" name="zipcodeName"  value="우편번호" disabled="disabled" style="background:#37415a; color:white; height:30px;"/>
    <input type="text" name="zipcodeDisp"  size="17" disabled="disabled" style=height:30px;/>
    <input type="hidden" name="member_zipcode"/>
    <input type="button" name="zipcodeBtn" value="우편번호검색" style="height:30px;" onclick="zipcodeRead('${root}')"/>
    </div>
    
    <div id="address1Disp"  style="margin:10px;">
    <input type="text" name="address1Name" value="주소" disabled="disabled" style="background:#37415a; color:white; height:30px;"/>
    <input type="text" name="address1Disp" size="30" disabled="disabled" style=height:30px;/>
    <input type="hidden" name="member_address1"/>
    </div>
    
    <div id="member_address2"  style="margin:10px;">
    <input type="text"name="address2Name"  value="상세주소" disabled="disabled" style="background:#37415a; color:white; height:30px;"/>
    <input type="text" name="member_address2"  size="30" style=height:30px;/>
    </div>
    
    <div id="member_phone"  style="margin:10px;">
    <input type="text" name="phoneName"  value="휴대폰 번호" disabled="disabled" style="background:#37415a; color:white; height:30px;"/>
    <input type="text" name="member_phone"  size="30" style=height:30px;/>
    </div>
    
    <br/><br/>
    <div align="center"><b style="font-size:18px">선택사항</b></div>
         <br/>
    <div id="choose">
    <input type="text" name="choose" value="관심분야" style="background:#37415a; color:white; height:30px;" disabled="disabled"/>
     <input type="checkbox" name="member_interestValue" value="문학"/>문학
	 <input type="checkbox" name="member_interestValue" value="교육도서"/>교육도서
     <input type="checkbox" name="member_interestValue" value="전공도서" style="margin:10px"/>전공도서<br/>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <input type="checkbox" name="member_interestValue" value="만화"/>만화
	 <input type="checkbox" name="member_interestValue" value="잡지"/>잡지
	 <input type="checkbox" name="member_interestValue" value="역사" style="margin:10px"/>역사<br/>
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 <input type="checkbox" name="member_interestValue" value="SF/판타지"/>SF/판타지
	 <input type="checkbox" name="member_interestValue" value="교양"/>교양<br/><br/>
	 <input type="hidden" name="member_interest"/>
    </div>
    
     <div id="choose" style="margin-left:-43px;">
    <input type="text" name="birthName" value="생년월일" style="background:#37415a; color:white; height:30px;"  disabled="disabled"/>
    <select name="member_birth_year">
    <option>년</option>
						<c:forEach var="year" begin="1900" end="${today}">
						<option value="${year}">${year}</option>
						</c:forEach>
					</select>
					
					<select name="member_birth_month">
						<option>월</option>
						<c:forEach var="month" begin="1" end="12">
						<option value="${month}">${month}</option>
						</c:forEach>
					</select>
					
					<select name="member_birth_day">
						<option>일</option>
						<c:forEach var="day" begin="1" end="31">
						<option value="${day}">${day}</option>
						</c:forEach>
					</select>
					<input type="hidden" name="member_birth"/>
    </div>
    <div id="member_email"  style="margin:10px;">
    <input type="text"name="emailName"  value="이메일" disabled="disabled" style="background:#37415a; color:white; height:30px;"/>
    <input type="text" name="member_email"  size="30" style=height:30px;/>
    </div>
     
    <input type="submit" size="40" style=height:30px; value="회원가입"/>
    </form>
	</div>
	</div>
	</div>
	
<jsp:include page="../main-bottom.jsp"/>
	<br/><br/>
</body>
</html>