<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/bookManage/style.css"/>
<link rel="stylesheet" type="text/css" href="${root}/css/bookManage/fullcalendar.css" />
<script type="text/javascript" src="${root}/script/bookManage/jquery-1.5.2.min.js"></script>
<script type="text/javascript" src="${root}/script/bookManage/jquery-ui-1.8.11.custom.min.js"></script>
<script type="text/javascript" src="${root}/script/bookManage/fullcalendar.min.js"></script>

	<link rel="Shortcut Icon" href="${root}/images/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="${root}/css/base.css" media="all" />
	<link rel="stylesheet" type="text/css" href="${root}/css/main.css" media="all" />
	<link rel="stylesheet" type="text/css" href="${root}/css/style.css" /><!-- 터치 슬라이드 스타일(CSS) 연동 -->
	
<script type="text/javascript">
	$(document).ready(function() {
	
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		var arrList=${bsList};
		
		$('#calendar').fullCalendar({
			header: {
				left: '',
				center: 'title',
				right: 'prev, next today'
			},
			editable: false,
			events: arrList
		});	
	});

</script>
<style type="text/css">
	#calendar {
		width: 800px;
		margin: 0 auto;
		float: left;
		}

</style>

</head>
<body>
	<c:set var="id" value="admin" scope="session"/>
<div id="wrap">
<dl class="hide">
 <dt>스킵 메뉴</dt>
 <dd><a href="#container">본문 바로가기</a></dd>
</dl>
<div id="header">
  <h1><a href="${root}/"><img src="${root}/images/logomain.png" alt="로고" style="border:0px solid red; position:absolute; top:-70px;"/></a></h1>
  <dl id="util_menu">
     <dt class="hide">유틸 메뉴</dt>
     <dd class="util_first">
        <ul>
           <c:if test="${id=='admin'}">
          <li>
				<a href="${root}/member/update.do">회원수정</a>
			</li>
			<li>
				<a href="${root}/member/logout.do">로그아웃</a>
			</li>
			<li>
				<a href="${root}/myPage/myPageOrderList.do">myPage</a>
			</li>
			<li>
				<a href="${root}/myBasket/myBasketList.do">장바구니</a>
			</li>
			<li>
				<a href="${root}/member/adminMain.do">관리자</a>
			</li>
           </c:if>
        </ul>
     </dd>
  </dl>
  <form action="${root}/userBook/userBookSerch.do" method="get" name="sch_f" id="sch_f">
     <fieldset>
        <legend>검색폼</legend>
        <p>
           <input type="text" name="keyword" id="keyword" title="검색어입력 " />
           <input type="image" src="${root}/images/gnb_search.png" alt="검색" style="width:50px; height:33px; position:absolute; top:0px; left:300px;"/>
        </p>
        <div id="suggest" style="display:; postion: absolute; left: 0px; top: 30px;">
			<div id="suggestList"></div>
		</div>
     </fieldset>
  </form>
  <h2 class="hide">메인메뉴</h2>
    <ul id="gnb">
     <li><a href="${root}/bookManage/bookManage.do"><img src="${root}/images/gnb_7_pic.png" alt="도서관리" style="width:100px; height:40px;"/></a>
        <ul class="sub7">
           	<li><a href="${root}/bookManage/bookInsert.do">도서등록</a></li>
			<li><a href="${root}/bookManage/bookStockList.do">재고관리</a></li>
			<li><a href="${root}/bookManage/bookSoldOutList.do">품절도서목록</a></li>
			<li><a href="${root}/bookManage/bookReOrderList.do">재입고현황</a></li>
			<li><a href="${root}/bookManage/bookGroupPurchase.do">공동구매</a></li>
			<li><a href="${root}/bookManage/bookSchedule.do">출간일정관리</a></li>
        </ul>
     </li>
     <li><a href="${root}/memberManager/memberManagerUpdate.do"><img src="${root}/images/gnb_8_pic.png" alt="회원관리" style="width:100px; height:40px;"/></a>
     	<ul class="sub8">
           	<li><a href="${root}/memberManager/memberManagerUpdate.do">관리자 정보수정</a></li>
			<li><a href="${root}/memberManager/memberManageCouponList.do">쿠폰 관리</a></li>
        </ul>
     </li>
     <li><a href="${root}/event/eventList.do"><img src="${root}/images/gnb_9_pic.png" alt="이벤트 관리" style="width:100px; height:40px;"/></a>
     	<ul class="sub9">
           	<li><a href="${root}/event/eventWrite.do">이벤트 등록</a></li>
			<li><a href="${root}/event/eventList.do">이벤트 목록</a></li>
        </ul>
     </li>
     <li><a href="${root}/location/locationList.do"><img src="${root}/images/gnb_10_pic.png" alt="지점관리" style="width:100px; height:40px;"/></a>
        <ul class="sub10">
           <li><a href="${root}/location/locationWrite.do">지점등록</a></li>
           <li><a href="${root}/location/locationList.do">지점목록</a></li>
        </ul>
     </li>
     <li><a href="${root}/help/adminHelpNoticeList.do"><img src="${root}/images/gnb_11_pic.png" alt="고객센터" style="width:100px; height:40px;"/></a>
     	<ul class="sub11">
           <li><a href="${root}/help/adminHelpNoticeList.do">공지사항</a></li>
           <li><a href="${root}/help/adminHelpQnAList.do">Q&A</a></li>
        </ul>
     </li>
     <li><a href="${root}/sales/salesDailyList.do"><img src="${root}/images/gnb_12_pic.png" alt="매출관리" style="width:100px; height:40px;"/></a>
     	<ul class="sub12">
     		<li><a href="${root}/sales/salesDailyList.do">일일매출</a></li>
           <li><a href="${root}/sales/salesMonthlyList.do">월간매출</a></li>
        </ul>
     </li>
  </ul>
</div>
</div>

	<div id="contents" style="background:white; border:0px solid black">
	<c:if test="${id=='admin'}">
		<div style="margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
			<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;> 도서 관리</b>
		</div>
		
		<div align="left" style="width: 120px;height: 1000px;float: left;">
			<jsp:include page="bookManageConNav.jsp"/>
		</div>
			
		<div align="left" style="float: left;margin: 20px 0 0 50px;width: 80%;">
			<h3 style="float: left;"> 도서 출간 일정</h3>
			<input style="float: right;" type="button" value="신간도서등록" onclick="location.href='${root}/bookManage/bookInsert.do?pageNumber=0'" />
			<div id="calendar"></div>
		</div>
	</c:if>
	</div>
	<c:if test="${id!='admin'}">
		<script type="text/javascript">
			alert("관리자만 접근이 가능한 페이지 입니다");
			location.href="${root}/member/goBookMain.do"
		</script>
	</c:if>
</body>
</html>