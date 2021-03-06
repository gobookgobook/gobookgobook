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
  <h1><a href="${root}/"><img src="${root}/images/logomain.png" alt="로고" style="margin-top:10px;"/></a></h1>
  <dl id="util_menu">
     <dt class="hide">유틸 메뉴</dt>
     <dd class="util_first">
        <ul>
           <li class="login_wrap">
        
             <!-- 로그인 폼 -->
			
             <form action="#" method="post" name="log_f" id="login_f">
               <fieldset>
                 <legend>로그인</legend>
                 <p class="user_id">
                    <label for="user_id">
                      <img src="${root}/images/login_title_id.gif" alt="아이디" />
                    </label>
                    <input type="text" name="user_id" id="user_id" />
                 </p>
                 <p class="user_pw">
                    <label for="user_pw">
                      <img src="${root}/images/login_title_pw.gif" alt="아이디" />
                    </label>
                    <input type="password" name="user_pw" id="user_pw" /></p>
                 <p class="log_btn">
                    <input type="image" src="${root}/images/login_btn.gif" alt="로그인버튼" />
                 </p>
                 <p class="join_btn_wrap">
                     <a href="${root}/member/register.do">회원가입</a>

                 </p>
                 <p class="login_close_btn">
                     <a href="#">
                     <img src="${root}/images/login_close_btn.gif" alt="닫기버튼" />
                     </a>
                 </p>
               </fieldset>
             </form>
           </li>
           
           <c:if test="${id!=null}">
           <li>
				<a href="${root}/member/logout.do">로그아웃</a>
			</li>
            <li>
           		<a href="${root}/memberManager/memberManagerUpdate.do">관리자정보수정</a>
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
           	<li><a href="${root}/bookManage/bookList.do">도서목록</a></li>
			<li><a href="${root}/bookManage/bookStockList.do">재고관리</a></li>
			<li><a href="${root}/bookManage/bookSoldOutList.do">품절도서목록</a></li>
			<li><a href="${root}/bookManage/bookSpecialPrice.do">특가도서목록</a></li>
			<li><a href="${root}/bookManage/bookManage.do">고객도서요청</a></li>
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
<hr />
</body>
</html>