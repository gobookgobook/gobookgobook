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
<title>Insert title here</title>
<link href="${root}/css/member/style.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="${root}/script/member/script.js"></script>
</head>
<body>	
	<jsp:include page="menu.jsp"/>
	<br/><br/>
	<div align="center">
		<font size="2"><b>회원가입(*필수입력사항입니다.)</b></font>
	</div>

	<div align="center">
		<form class="form_style" name="memberForm" action="${root}/member/register.do" 
			method="post" onsubmit="return registerForm(this)">
			<div class="line">
				<label class="title">아이디</label>
				<span class="content">
					*<input type="text" name="id_check" />	
					<input type="hidden" name="member_id"/>
					<input type="button" value="아이디중복" onclick="idCheck('${root}',memberForm)" />
				</span>
			</div>
			
			<div class="line">
				<label  class="title">비밀번호</label>
				<span class="content">
					*<input type="password" name="member_password" />
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
					*<input type="text" name="member_name"/>
				</span>
			</div>
			
			<div class="line">
				<label class="title">우편번호</label>
				<span class="content">
					*<input type="text" name="zipcodeDisp" disabled="disabled"/>
					<input type="hidden" name="member_zipcode"/>
					<input type="button" name="zipcodeBtn" value="우편번호검색" onclick="zipcodeRead('${root}')"/>
				</span>
		  	</div>
			
			<div class="line">
				<label class="title">주소</label>
				<span class="content">
					*<input type="text" name="address1Disp" size="48" disabled="disabled"/>
					<input type="hidden" name="member_address1"/>
				</span>
			</div>
			
			<div class="line">
				<label class="title">상세주소</label>
				<span class="content">
					*<input type="text" name="member_address2" size="48" />
				</span>
			</div>
			
			<div class="line">
				<label class="title">전화번호</label>
				<span class="content">
					*<input type="text" name="member_phone" size="48" />
				</span>
			</div>
						
			<div class="line" align="center" >
				<label class="title"></label>
				<span class="content">
					<font size="2"><b>--------선택사항--------</b></font>
				</span>
			</div>
			
			<div class="line">
				<label class="title">관심분야</label>
				<span class="content">
					<input type="checkbox" name="member_interestValue" value="문학"/>문학
					<input type="checkbox" name="member_interestValue" value="교육도서"/>교육도서
					<input type="checkbox" name="member_interestValue" value="전공도서"/>전공도서
					<input type="checkbox" name="member_interestValue" value="만화"/>만화
					<input type="checkbox" name="member_interestValue" value="잡지"/>잡지
					<input type="checkbox" name="member_interestValue" value="역사"/>역사
					<input type="checkbox" name="member_interestValue" value="SF/판타지"/>SF/판타지
					<input type="checkbox" name="member_interestValue" value="교양"/>교양
					<input type="hidden" name="member_interest"/>
				</span>
			</div>
			
			<div class="line">
				<label class="title">생년월일</label>
				<span class="content">
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
				</span>
			</div>
			
			<div class="line">
				<label class="title">이메일</label>
				<span class="content">
					<input type="text" name="member_email" size="25" />
				</span>
			</div>
			
			<div class="line" style="width:591px; border-width:2px; text-align:center;">
				<input type="submit" value="가입" />
				<input type="reset" value="취소" />
			</div>
		</form>
	</div>
	
	<c:if test="${check >0}">
		<script type="text/javascript">
			alert("회원가입을 축하드립니다.\n회원으로 로그인하세요.");
			location.href="${root}/member/login.do";
		</script>
	</c:if>
	
	<c:if test="${check == 0 }">
		<script type="text/javascript">
			alert("회원가입에 실패하였습니다.");
			location.href="${root}/member/register.do";
		</script>
	</c:if>
</body>
</html>