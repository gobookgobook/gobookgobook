<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/memberManage/memberManage.css"/>
<script type="text/javascript" src="${root}/js/memberManage/memberManager.js"></script>
</head>
<body>
	<div class="memberManagerUpdate">
		<jsp:include page="menu.jsp"/>
		<div class="memberMangerBody">
			관리자 회원 정보 수정
			<hr>
			<form class="memberMnager" name="managerForm" action="${root}/memberManager/memberManagerUpdateOk.do" method="post" onsubmit="">
			<input type="hidden" name="member_id" value="${memberDto.member_id}">
				<div class="managerLine">
					<label class="managertitle">관리자 아이디</label>
					<span class="managercontent">
						<input type="text" name="id" value="${memberDto.member_id}" disabled="disabled"/>
					</span>
				</div>
				<div class="managerLine">
					<label class="managertitle">관리자 비밀번호</label>
					<span class="managercontent">
						<input type="password" name="member_password" value="${memberDto.member_password}"/>
					</span>
				</div>		
				<div class="managerLine">
					<label class="managertitle">관리자 이름</label>
					<span class="managercontent">
						<input type="text" name="member_name" value="${memberDto.member_name}"/>
					</span>
				</div>
				<div class="managerLine">
					<label class="managertitle">우편번호</label>
					<span class="managercontent">
						<input type="text" name="member_zipcode_view" value="${memberDto.member_zipcode}" size="10" disabled="disabled"/>
						<input type="hidden" name="member_zipcode" value="${memberDto.member_zipcode}" />
						<input type="button" name="managerbtn" value="우편번호검색" onclick="zipcodeManagerRead('${root}')"/>
					</span>
				</div>
				<div class="managerLine">
					<label class="managertitle">관리자 주소</label>
					<span class="managercontent">
						<input type="text" name="member_address1_view" value="${memberDto.member_address1}" disabled="disabled" size="30"/>
						<input type="hidden" name="member_address1" value="${memberDto.member_address1}" />
					</span>
				</div>
				<div class="managerLine">
					<label class="managertitle">관리자 상세주소</label>
					<span class="managercontent">
						<input type="text" name="member_address2" value="${memberDto.member_address2}"/>
					</span>
				</div>
				<div class="managerLine">
					<label class="managertitle">전화번호</label>
					<span class="managercontent">
						<input type="text" name="member_phone" value="${memberDto.member_phone}"/>
					</span>
				</div>
				<div class="managerLine" style="text-align: center;">
					<input type="submit" value="수정"/>
					<input type="reset" value="취소"/>
				</div>			
			</form>
		</div>
	</div>
</body>
</html>