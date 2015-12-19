<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>GoBookGoBook </title>
	<link rel="Shortcut Icon" href="${root}/images/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="${root}/css/base.css" media="all" />
	<link rel="stylesheet" type="text/css" href="${root}/css/main.css" media="all" />
	<script type="text/javascript" src="${root}/js/jquery-1.10.2.min.js"></script> <!-- 제이쿼리 라이이브러리 연동 -->
	<link rel="stylesheet" type="text/css" href="${root}/css/style.css" /><!-- 터치 슬라이드 스타일(CSS) 연동 -->
	<script type="text/javascript" src="${root}/js/swipe.js"></script> <!-- 터치 슬라이드 플러그인 연동 -->
	<script type="text/javascript" src="${root}/js/jquery.bxslider.min.js"></script>  <!-- bxSlider 플러그인 연동 -->
	<script type="text/javascript" src="${root}/js/jquery-ui-1.10.4.custom.min.js"></script> <!-- UI 플러그인 연동 -->
	<script type="text/javascript" src="${root}/js/jquery.cookie.js"></script>  <!-- 쿠키 플러그인 연동 -->
	<script type="text/javascript" src="${root}/js/common.js"></script>
	<script type="text/javascript" src="${root}/js/main.js"></script>
	<script type="text/javascript" src="${root}/script/userBook/script.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
</head>
<body>
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
           <input type="text" name="keyword" id="keyword" title="검색어입력 " onkeydown="startSuggest('${root}')"/>
           <input type="image" src="${root}/images/gnb_search.png" alt="검색" />
        </p>
        <div id="suggest" style="display:; postion: absolute; left: 0px; top: 30px;">
			<div id="suggestList"></div>
		</div>
     </fieldset>
  </form>
  <h2 class="hide">메인메뉴</h2>
   <ul id="gnb">
     <li><a href="${root}/bookManage/bookManage.do"><img src="${root}/images/gnb_ad1_pic.png" alt="도서관리" style="width:100px; height:40px;"/></a>
        <ul class="sub1">
           	<li><a href="${root}/bookManage/bookInsert.do">도서등록</a></li>
			<li><a href="${root}/bookManage/bookStockList.do">재고관리</a></li>
			<li><a href="${root}/bookManage/bookSoldOutList.do">품절도서목록</a></li>
			<li><a href="${root}/bookManage/bookReOrderList.do">재입고현황</a></li>
			<li><a href="${root}/bookManage/bookGroupPurchase.do">공동구매</a></li>
			<li><a href="${root}/bookManage/bookSchedule.do">출간일정관리</a></li>
        </ul>
     </li>
     <li><a href="${root}/memberManager/memberManagerUpdate.do"><img src="${root}/images/gnb_ad2_pic.png" alt="회원관리" style="width:100px; height:40px;"/></a>
     	<ul class="sub3">
           	<li><a href="${root}/memberManager/memberManagerUpdate.do">관리자 정보수정</a></li>
			<li><a href="${root}/memberManager/memberManageCouponList.do">쿠폰 관리</a></li>
        </ul>
     </li>
     <li><a href="${root}/event/eventList.do"><img src="${root}/images/gnb_ad3_pic.png" alt="이벤트 관리" style="width:100px; height:40px;"/></a>
     	<ul class="sub3">
           	<li><a href="${root}/event/eventWrite.do">이벤트 등록</a></li>
			<li><a href="${root}/event/eventList.do">이벤트 목록</a></li>
        </ul>
     </li>
     <li><a href="${root}/location/locationList.do"><img src="${root}/images/gnb_ad4_pic.png" alt="지점관리" style="width:100px; height:40px;"/></a>
        <ul class="sub4">
           <li><a href="${root}/location/locationWrite.do">지점등록</a></li>
           <li><a href="${root}/location/locationList.do">지점목록</a></li>
           <li><a href="#">지점 확인</a></li>
        </ul>
     </li>
     <li><a href="#"><img src="${root}/images/gnb_ad5_pic.png" alt="고객센터" style="width:100px; height:40px;"/></a>
     	<ul class="sub5">
     		<li><a href="#">1:1 문의</a></li>
           <li><a href="${root}/help/adminHelpNoticeList.do">공지사항</a></li>
           <li><a href="${root}/help/adminHelpQnAListSelect.do">Q&A</a></li>
           <li><a href="#">지점 확인</a></li>
        </ul>
     </li>
     <li><a href="${root}/sales/salesDailyList.do"><img src="${root}/images/gnb_ad6_pic.png" alt="매출관리" style="width:100px; height:40px;"/></a>
     	<ul class="sub6">
     		<li><a href="${root}/sales/salesDailyList.do">일일매출</a></li>
           <li><a href="${root}/sales/salesMonthlyList.do">월간매출</a></li>
        </ul>
     </li>
  </ul> 
</div>
</div>
</body>
</html>