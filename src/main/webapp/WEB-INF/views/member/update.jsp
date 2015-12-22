<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var = "root" value="${pageContext.request.contextPath}"/>
<c:set var="date" value="<%=new Date() %>"/>
<fmt:formatDate var="today" value="${date}" pattern="yyyy"/>
<fmt:formatDate var="birth" value="${memberDto.member_birth}" type="date" pattern="yyyy/MM/dd"/>
<html>
<head>
<jsp:include page="../main-top.jsp"/>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${root}/script/member/script.js"></script>
</head>
<body>
<div id="contents" style="height:720px; background:white; position:static; border:0px solid red;"><br/><br/><br/><br/>
  <div align="center">
	<div class="container" style="width:90%; border:0px solid black; margin-top:-60px;">
	  	<br/><br/>
	  	<div align="center"><b style="font-size:18px">회원정보수정</b></div>
         <br/>
	
	<form class="form-style" role="form" name="memberForm" action="${root}/member/update.do" method="post" onsubmit="return registerForm(this)">
	

	<div id="member_id" style="margin-top:10px; margin-left:-68px;">
	<input type="text" name="idName" value="아이디" disabled="disabled"  style="background:#37415a;  color:white; height:30px;"/>
	<input type="text" name="id_check"  value= "${memberDto.member_id }" size="60" style=height:30px; disabled="disabled"/>
	<input type="hidden" name="member_id" value="${memberDto.member_id }"/>
    </div> 
    
    <div id="member_password"  style="margin-top:10px; margin-left:-68px;">
    <input type="text" name="passwordName" value="비밀번호" disabled="disabled" style="background:#37415a;  color:white; height:30px;"/>
    <input type="password" name="member_password" value = "${memberDto.member_password }" size="60" style=height:30px;/>
    </div>
    
    <div id="passwordCheck"  style="margin-top:10px; margin-left:-68px;">
    <input type="text" name="passwordCheckName" value="비밀번호확인" disabled="disabled" style="background:#37415a;  color:white; height:30px;"/>
    <input type="password" name="passwordCheck" value = "${memberDto.member_password }" size="60" style=height:30px;/>
    </div>
    
    <div id="member_name"  style="margin-top:10px; margin-left:-68px;">
    <input type="text" name="member_nameName" value="이름" disabled="disabled" style="background:#37415a;  color:white; height:30px;"/>
    <input type="text" name="member_name"  value = "${memberDto.member_name}" size="60" style=height:30px; disabled="disabled"/>
    </div>
    
    <div id="zipcodeDisp"  style="margin-top:10px; margin-left:-68px;">
    <input type="text" name="zipcodeName"  value="우편번호" disabled="disabled" style="background:#37415a;  color:white; height:30px;"/>
    <input type="text" name="zipcodeDisp"  size="47" value="${memberDto.member_zipcode}" style=height:30px; disabled="disabled"/>
    <input type="hidden" name="member_zipcode" value="${memberDto.member_zipcode}"/>
    <input type="button" name="zipcodeBtn" value="우편번호검색" style="height:30px;" onclick="zipcodeRead('${root}')"/>
    </div>
    
    <div id="address1Disp"  style="margin-top:10px; margin-left:-68px;">
    <input type="text" name="address1Name" value="주소" disabled="disabled" style="background:#37415a;  color:white; height:30px;"/>
    <input type="text" name="address1Disp" size="60" value="${memberDto.member_address1}" style=height:30px; disabled="disabled"/>
    <input type="hidden" name="member_address1" value="${memberDto.member_address1}"/>
    </div>
    
    <div id="member_address2"  style="margin-top:10px; margin-left:-68px;">
    <input type="text"name="address2Name"  value="상세주소" disabled="disabled" style="background:#37415a;  color:white; height:30px;"/>
    <input type="text" name="member_address2"  size="60" value="${memberDto.member_address2}" style=height:30px;/>
    </div>
    
    <div id="member_phone"  style="margin-top:10px; margin-left:-68px;">
    <input type="text" name="phoneName"  value="휴대폰 번호" disabled="disabled" style="background:#37415a;  color:white; height:30px;"/>
    <input type="text" name="member_phone" value="${memberDto.member_phone}" size="60" style=height:30px;/>
    </div>
    
    <br/><br/>
    <div align="center"><b style="font-size:18px">선택사항</b></div>
         <br/>
    <div id="choose">
    <input type="text" name="choose" value="관심분야"  style="background:#37415a;  color:white; height:30px; margin-top:10px; margin-left:-40px;" disabled="disabled"/>
     <input type="checkbox" name="member_interestValue" value="문학"/>문학
	 <input type="checkbox" name="member_interestValue" value="교육도서"/>교육도서
     <input type="checkbox" name="member_interestValue" value="전공도서"/>전공도서
     <input type="checkbox" name="member_interestValue" value="만화"/>만화
	 <input type="checkbox" name="member_interestValue" value="잡지"/>잡지
	 <input type="checkbox" name="member_interestValue" value="역사"/>역사
	 <input type="checkbox" name="member_interestValue" value="SF/판타지"/>SF/판타지
	 <input type="checkbox" name="member_interestValue" value="교양"/>교양
	 <input type="hidden" name="member_interest"/>
     <c:forTokens var="interest" items="${memberDto.member_interest}" delims=",">
						<script type="text/javascript">
							for(var i=0;i<memberForm.member_interestValue.length;i++){
								if(memberForm.member_interestValue[i].value=="${interest}"){
									memberForm.member_interestValue[i].checked=true;
								}
							}
						</script>
	</c:forTokens>
    </div>
    
     <div id="choose" style="margin-top:10px; margin-left:-300px;">
    <input type="text" name="birthName" value="생년월일" style="background:#37415a;  color:white; height:30px;"  disabled="disabled"/>
 	  				<select name="member_birth_year"  onfocus="javascript: this.value=1980">
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
					<c:if test="${birth!='1800/01/01'}">
						<c:forTokens var="userBirth" items="${birth}" delims="/">
							<script type="text/javascript">
								
								if(memberForm.member_birth_year.value!="년"){
									if(memberForm.member_birth_month.value!="월"){
										if(memberForm.member_birth_day.value=="일"){
											memberForm.member_birth_day.value=parseInt("${userBirth}");
										}
									}
								}
								
								if(memberForm.member_birth_year.value!="년"){
									if(memberForm.member_birth_month.value=="월"){
										memberForm.member_birth_month.value=parseInt("${userBirth}");
									}
								}
							
								if(memberForm.member_birth_year.value=="년"){
									memberForm.member_birth_year.value="${userBirth}";
								}
							</script>
						</c:forTokens>
					</c:if>
    </div>
    <div id="member_email"  style="margin-top:10px; margin-left:-75px;">
    <input type="text"name="emailName"  value="이메일" disabled="disabled" style="background:#37415a;  color:white; height:30px;"/>
    <input type="text" name="member_email" value="${memberDto.member_email}" size="60" style=height:30px;/><br/><br/><br/>
    </div>
     
    <input type="submit" size="40" style= background:#37415a;color:white;width:80px;height:30px; value="수정"/>
    </form>
	</div>
	</div>
	</div>
	
<jsp:include page="../main-bottom.jsp"/>
	<br/><br/>
</body>
</html>