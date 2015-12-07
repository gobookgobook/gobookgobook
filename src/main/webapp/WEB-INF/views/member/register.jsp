<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="${root}/css/member/style.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="${root}/script/member/script.js"></script>
</head>
<body>	
	<jsp:include page="aStart.jsp"/>
	<br/><br/>
	
	<div align="center">
		<font size="2"><b>회원가입(*필수입력사항입니다.)</b></font>
	</div>

	<div align="center">
		<form class="form_style" name="memberForm" action="${root}/member/registerOk.do" 
			method="post" onsubmit="return registerForm(this)">
			<div class="line">
				<label class="title">아이디</label>
				<span class="content">
					*<input type="text" name="id_check" />	
					<input type="hidden" name="id"/>
					<input type="button" value="아이디중복" onclick="idCheck('${root}',memberForm)" />
				</span>
			</div>
			
			<div class="line">
				<label  class="title">비밀번호</label>
				<span class="content">
					*<input type="password" name="password" />
				</span>
			</div>
			
			<div class="line">
				<label class="title">비밀번호확인</label>
				<span class="content">
					*<input type="password" name="passwordCheck"/>
				</span>
			</div>
	
			<div class="line">
				<label class="title">이름</label>
				<span class="content">
					*<input type="text" name="name"/>
				</span>
			</div>
			
			<div class="line">
				<label class="title">우편번호</label>
				<span class="content">
					*<input type="text" name="zipcode"/>
					<input type="button" value="우편번호검색" onclick="zipcodeRead('${root}')"/>
				</span>
		  	</div>
			
			<div class="line">
				<label class="title">주소</label>
				<span class="content">
					*<input type="text" name="address1" size="48" />
				</span>
			</div>
			
			<div class="line">
				<label class="title">상세 주소</label>
				<span class="content">
					*<input type="text" name="address2" size="48" />
				</span>
			</div>
			
			<div class="line">
				<label class="title">전화번호</label>
				<span class="content">
					*<input type="text" name="phone" size="48" />
				</span>
			</div>
						
			<div class="line" align="center" >
				<label class="title"></label>
				<span class="content">
					<font size="2"><b>--------선택사항--------</b></font>
				</span>
			</div>
			
			<div class="line">
				<label class="title">직업</label>
				<span class="content">
					<input type="checkbox" name="interest"/>문학
					<input type="checkbox" name="interest"/>교육도서
					<input type="checkbox" name="interest"/>전공도서
					<input type="checkbox" name="interest"/>만화
					<input type="checkbox" name="interest"/>잡지
					<input type="checkbox" name="interest"/>역사
					<input type="checkbox" name="interest"/>SF/판타지
					<input type="checkbox" name="interest"/>교양
				</span>
			</div>
			
			<div class="line">
				<label class="title">생년월일</label>
				<span class="content">
					<input type="text" name="birth" size="25" />
				</span>
			</div>
			
			<div class="line">
				<label class="title">이메일</label>
				<span class="content">
					<input type="text" name="email" size="25" />
				</span>
			</div>
			
			<div class="line" style="width:501px; border-width:2px; text-align:center;">
				<input type="submit" value="가입" />
				<input type="reset" value="취소" />
			</div>
		</form>
	</div>
</body>
</html>