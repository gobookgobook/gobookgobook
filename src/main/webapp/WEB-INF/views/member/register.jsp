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
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${root}/script/member/script.js"></script>
<jsp:include page="../main-top.jsp"/>
</head>
<body>	
	<br/><br/>	
  <div id="contents" style="height:560px; background:white; border:1px solid black;"><br/><br/><br/><br/>
  <div align="center">
		<form class="form_style" name="memberForm" action="${root}/member/register.do" 	method="post" onsubmit="return registerForm(this)">
		<div class="container" style="width:50%; border:0px solid black; position:absolute; top:10px; left:300px;">
		<table class="table table-bordered">
		  <tr style="color:white">
		    <td class="mytable" style="background:#37415A; width:100px;">아이디</td>
		    <td class="mytable" style="background:#37415A"><input type="text" name="id_check"/>
		    <input type="hidden" name="member_id"/>
					<input type="button"  value="아이디중복" onclick="idCheck('${root}',memberForm)" /></td>
		  </tr>
		  
		  <tr style="color:white">
					<td class="mytable" style="background:#37415A">비밀번호</td>
					<td class="mytable" style="background:#37415A"><input type="password" name="member_password"/></td>
		  </tr>		  
		  
		  <tr style="color:white">
					<td class="mytable" style="background:#37415A">비밀번호 확인</td>
					<td class="mytable" style="background:#37415A"><input type="password" name="passwordCheck"/></td>
		  </tr>
		  
		  <tr style="color:white">
					<td class="mytable" style="background:#37415A">이름</td>
					<td class="mytable" style="background:#37415A"><input type="text" name="member_name"/></td>
		  </tr>
		  
		  <tr style="color:white">
					<td class="mytable" style="background:#37415A">우편번호</td>
					<td class="mytable" style="background:#37415A"><input type="text" name="zipcodeDisp" />
					<input type="hidden" name="member_zipcode"/>
					<input type="button" name="zipcodeBtn" value="우편번호검색" onclick="zipcodeRead('${root}')"/></td>
		  </tr>
		  
		  <tr style="color:white">
					<td class="mytable" style="background:#37415A">주소</td>
					<td class="mytable" style="background:#37415A"><input type="text" name="address1Disp" size="48" />
					<input type="hidden" name="member_address1"/></td>
		  </tr>
		  
		  <tr style="color:white">
					<td class="mytable" style="background:#37415A">상세주소</td>
					<td class="mytable" style="background:#37415A"><input type="text" name="member_address2" size="48" /></td>
		  </tr>
		  
		  <tr style="color:white">
					<td class="mytable" style="background:#37415A">전화번호</td>
					<td class="mytable" style="background:#37415A"><input type="text" name="member_phone" size="48" /></td>
		  </tr>
		  
		  <tr style="color:white">
					<td class="mytable" style="background:#37415A">선택</td>
					<td class="mytable" style="background:#37415A"><font size="1"><b>--------선택사항--------</b></font></td>
		  </tr>
		  
		  <tr style="color:white">
					<td class="mytable" style="background:#37415A">관심분야</td>
					<td class="mytable" style="background:#37415A">
					<input type="checkbox" name="member_interestValue" value="문학"/>문학
					<input type="checkbox" name="member_interestValue" value="교육도서"/>교육도서
					<input type="checkbox" name="member_interestValue" value="전공도서"/>전공도서
					<input type="checkbox" name="member_interestValue" value="만화"/>만화
					<input type="checkbox" name="member_interestValue" value="잡지"/>잡지
					<input type="checkbox" name="member_interestValue" value="역사"/>역사
					<input type="checkbox" name="member_interestValue" value="SF/판타지"/>SF/판타지
					<input type="checkbox" name="member_interestValue" value="교양"/>교양
					<input type="hidden" name="member_interest"/></td>
		  </tr>
		  
		  <tr style="color:white">
					<td class="mytable" style="background:#37415A">생년월일</td>
					<td class="mytable" style="background:#37415A">
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
					<input type="hidden" name="member_birth"/></td>
		  </tr>
		  
		  <tr style="color:white">
					<td class="mytable" style="background:#37415A">이메일</td>
					<td class="mytable" style="background:#37415A"><input type="text" name="member_email" size="25" /></td>
		  </tr>
		  
		  <tr align="center" style="color:white">
					<td class="mytable"  colspan="2" align="center" style="background:#37415A">
						<input type="submit" class="btn btn-primary btn-xs" value="확인"/>
						<input type="reset" class="btn btn-warning btn-xs" value="취소"/>
					</td>
				</tr>
		</table>
		</div>
		</form>
	</div>
</div>
<jsp:include page="../main-bottom.jsp"/>
	<br/><br/>

</body>
</html>