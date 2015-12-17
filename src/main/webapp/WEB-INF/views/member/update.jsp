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
<meta charset="UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${root}/script/member/script.js"></script>
<jsp:include page="../main-top.jsp"/>
</head>
<body>
	<br/><br/>
<div id="contents" style="height:560px; background:white;"><br/><br/><br/><br/>	
<div align="center">
	<form class="form_style" name="memberForm" action="${root}/member/update.do" method="post" onsubmit="return registerForm(this)">
	  <div class="container" style="width:90%; border:0px solid black; position:absolute; top:5px; left:10px;">
		  <h2>회원정보수정</h2>
		  <table class="table table-bordered" style="border-top-color:rgb(209,209,209); width:860px;">
				 <tbody>
			    <tr>
			    <th style="background:#B2CCFF">아이디</th>
			     <td colspan="3">
			       <input type="text" name="id_check" size="25" value= "${memberDto.member_id }" disabled="disabled"/>
			       <input type="hidden" name="member_id" value="${memberDto.member_id }"/>
			       <input type="button"  value="아이디중복" onclick="idCheck('${root}',memberForm)" />
			     </td>
			    </tr>
			   
			    <tr>
			    <th style="background:#B2CCFF">비밀번호</th>
			     <td colspan="3">
			       <input type="password" name="member_password" value = "${memberDto.member_password }" size="25"/>
			     </td>
			    </tr>
			    
			    <tr>
			    <th style="background:#B2CCFF">비밀번호 확인</th>
			     <td colspan="3">
			       <input type="password" name="passwordCheck" size="25"/>
			       <span>비밀번호를 한번 더 입력해주세요</span>
			     </td>
			    </tr>
			    
			    <tr>
			    <th style="background:#B2CCFF">이름</th>
			     <td colspan="3">
			       <input type="text" name="member_name" size="25" value = "${memberDto.member_name}" disabled="disabled"/>
			     </td>
			    </tr>
			    
			     <tr>
			    <th style="background:#B2CCFF">휴대폰 번호</th>
			     <td colspan="3">
			       <input type="text" name="member_phone" value="${memberDto.member_phone}" size="25"/>
			     </td>
			    </tr>
			    		    
			     <tr>
			    <th style="background:#B2CCFF">우편번호</th>
			     <td colspan="3">
			       <input type="text" name="zipcodeDisp" size="25"/>
						<input type="hidden" name="member_zipcode"/>
						<input type="button" name="zipcodeBtn" value="우편번호검색" onclick="zipcodeRead('${root}')"/>
				 </td>
			    </tr>
			    	    
			     <tr>
			    <th style="background:#B2CCFF">주소</th>
			     <td colspan="3">
			       <input type="text" name="address1Disp" size="50"/>
			     </td>
			    </tr>
			    
			     <tr>
			    <th style="background:#B2CCFF">상세주소</th>
			     <td colspan="3">
			       <input type="text" name="member_address2" size="50"/>
			     </td>
			    </tr>
			    
			     <tr>
			    <th style="background:#B2CCFF">관심분야</th>
			     <td colspan="3">
				      <input type="checkbox" name="member_interestValue" value="문학"/>문학
					  <input type="checkbox" name="member_interestValue" value="교육도서"/>교육도서
					  <input type="checkbox" name="member_interestValue" value="전공도서"/>전공도서
					  <input type="checkbox" name="member_interestValue" value="만화"/>만화
					  <input type="checkbox" name="member_interestValue" value="잡지"/>잡지
					  <input type="checkbox" name="member_interestValue" value="역사"/>역사
					  <input type="checkbox" name="member_interestValue" value="SF/판타지"/>SF/판타지
					  <input type="checkbox" name="member_interestValue" value="교양"/>교양
					  <input type="hidden" name="member_interest"/>
			     </td>
			    </tr>
			    
			    <tr>
			    <th style="background:#B2CCFF">생년월일</th>
			     <td colspan="3">
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
						</td>
			    </tr>
			    
			    <tr>
			    <th style="background:#B2CCFF">이메일</th>
			     <td colspan="3">
			       <input type="text" name="member_email" size="30"/>
			     </td>
			    </tr>
			    
			    <tr align="center">
			     <td colspan="3">
			       <input type="submit" class="btn btn-primary btn-xs" value="수정"/>
				   <input type="reset" class="btn btn-warning btn-xs" value="취소"/>
			     </td>
			    </tr>
			  </tbody>
		      </table>
		    </div>
		</form>
	</div>

</div>
<jsp:include page="../main-bottom.jsp"/>
	<br/><br/>		
</body>
</html>