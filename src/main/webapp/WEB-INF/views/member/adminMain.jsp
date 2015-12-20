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
	<script type="text/javascript" src="${root}/script/jquery.js"></script>
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
<c:if test="${id=='admin'}">
<div id="wrap">
<dl class="hide">
 <dt>스킵 메뉴</dt>
 <dd><a href="#container">본문 바로가기</a></dd>
</dl>
<div id="header">
  <h1><a href="${root}/"><img src="${root}/images/logomain.png" alt="로고" /></a></h1>
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
           <input type="image" src="${root}/images/gnb_search3.png" alt="검색" style="width:50px; height:33px; position:absolute; top:0px; left:310px;"/>
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
        </ul>
     </li>
     <li><a href="#"><img src="${root}/images/gnb_ad5_pic.png" alt="고객센터" style="width:100px; height:40px;"/></a>
     	<ul class="sub5">
           <li><a href="${root}/help/adminHelpNoticeList.do">공지사항</a></li>
           <li><a href="${root}/help/adminHelpQnAList.do">Q&A</a></li>
        </ul>
     </li>
     <li><a href="${root}/sales/salesDailyList.do"><img src="${root}/images/gnb_ad6_pic.png" alt="매출관리" style="width:100px; height:40px;"/></a>
     	<ul class="sub6">
     		<li><a href="${root}/sales/salesDailyList.do">일일매출</a></li>
           <li><a href="${root}/sales/salesMonthlyList.do">월간매출</a></li>
        </ul>
     </li>
  </ul>
  <p id="date_wrap">
      <span class="year">0000</span> 년
      <span class="month">00</span> 월
      <span class="date">00</span>일
   </p>
</div>
<hr />
<div id="visual">
 <div id="mySwipe"  class='swipe'>
    <ul class="touch_banner swipe-wrap"> <!-- 배너 목록 -->
      <li style="margin-left:-10px;"><a href="${root}/event/eventRead.do?event_bunho=27"><img src="${root}/images/이벤트7.jpg" alt=""/></a></li>
      <li><a href="${root}/event/eventRead.do?event_bunho=28"><img src="${root}/images/이벤트8.jpg" alt=""/></a></li>
      <li><a href="${root}/event/eventRead.do?event_bunho=29"><img src="${root}/images/이벤트9.jpg" alt=""/></a></li>
   </ul>
  </div>
  <ul class="touch_bullet"> <!-- 배너 위치 표시 -->
     <li><img src="${root}/images/visual_bullet_on.png" class="active" alt="" /></li>
     <li><img src="${root}/images/visual_bullet_off.png" alt="" /></li>
     <li><img src="${root}/images/visual_bullet_off.png" alt="" /></li>
  </ul>
  <p class="touch_left_btn"> <!-- 이전 버튼 -->
     <a href="#">
     <img src="${root}/images/visual_btn_left.png" alt="이전 배너" />
     </a>
  </p>
  <p class="touch_right_btn"> <!-- 이전 버튼 -->
     <a href="#">
     <img src="${root}/images/visual_btn_right.png" alt="다음 배너" />
     </a>
  </p>
</div>
<hr />
<div id="contents">

 <div id="bestbook_zone">
   <h3>
      <img src="${root}/images/bestbook_title.gif" alt="이지스퍼블리싱 베스트 책" />
   </h3>
   <div id="best_bg">
      <ul>
        <li><a href="#"><img src="${root}/images/bestbook_list_1.PNG" alt="" />
              <span><strong>위험한 과학책</strong>랜들 먼로</span></a>
        </li>
        <li><a href="#"><img src="${root}/images/bestbook_list_2.PNG" alt="" />
              <span><strong>세상의 모든 공식</strong>존 M.헨쇼</span></a>
        </li>
        <li><a href="#"><img src="${root}/images/bestbook_list_3.PNG" alt="" />
              <span><strong>정재승의 과학콘서트</strong>정재승</span></a>
        </li>
        <li><a href="#"><img src="${root}/images/bestbook_list_4.PNG" alt="" />
              <span><strong>마음의 미래</strong>미치오 카쿠</span></a>
        </li>
        <li><a href="#"><img src="${root}/images/bestbook_list_5.PNG" alt="" />
              <span><strong>과학, 인문으로 탐구하다</strong>박민아, 선유정</span></a>
        </li>
        <li><a href="#"><img src="${root}/images/bestbook_list_6.PNG" alt="" />
              <span><strong>이종필의 아주 특별한 상대성이론 강의</strong>이종필</span></a>
        </li>
        <li><a href="#"><img src="${root}/images/bestbook_list_7.PNG" alt="" />
              <span><strong>뇌를 바꾼 공학,공학을 바꾼 뇌</strong>임창환</span></a>
        </li>
        <li><a href="#"><img src="${root}/images/bestbook_list_8.PNG" alt="" />
              <span><strong>아주 특별한 생물학 수업</strong>장수철, 이재성</span></a>
        </li>
        <li><a href="#"><img src="${root}/images/bestbook_list_9.PNG" alt="" />
              <span><strong>빅 히스토리 BIG HISTORY</strong>데이비드 크리스천, 밥 베인</span>
              </a>
       </li>
        <li><a href="#"><img src="${root}/images/bestbook_list_10.PNG" alt="" />
             <span><strong>인문학 습관</strong>윤소정</span></a>
        </li>
      </ul>
      <p class="prev_btn">
         <a href="#">
         <img src="${root}/images/bestbook_btn_left.png" alt="이전으로 이동" />
         </a>
      </p>
      <p class="next_btn">
         <a href="#">
         <img src="${root}/images/bestbook_btn_right.png" alt="다음으로 이동" />
         </a>
      </p>
   </div>
 </div> <!-- close of bestbook_zone -->
 
 
 <div id="quick_menu" >
   <h3><span>최근 본 도서</span></h3>
   <ul>
     <li><img src="${root}/images/bestbook_list_1.PNG" alt="" /></li>
     <li><img src="${root}/images/bestbook_list_2.PNG" alt="" /></li>
     <li><img src="${root}/images/bestbook_list_3.PNG" alt="" /></li>    
     <li><a href="#"><img src="${root}/images/quick_top_btn.png" alt="상단으로 이동" /></a></li>
   </ul>
 </div>

 <p id="pop_wrap">
  <img src="${root}/images/popup.jpg" alt="검색이 잘 되는 키워드는 따로 있다!" usemap="#pop" />
  <map name="pop" id="pop">
   <area shape="rect" coords="255,332,290,345" href="#" alt="창닫기" />
   <area shape="rect" coords="95,332,215,345" href="#" alt="하루동안 창 닫기" />
  </map>
 </p>
</div> <!-- close of contents -->
</div> <!-- close of wrap -->
<hr />
<div id="footer_wrap">
<div id="inner_footer">
 <h3 class="footer_logo">
    <a href="${root}/"><img src="${root}/images/logomain.png" alt="로고"/></a>
 </h3>
 <br/><br/>
 <div id="relSite_wrap">
   <h3><img src="${root}/images/rel_site_title.gif" alt="관련 사이트 이동하기" /></h3>
   <form action="#" method="get" name="rel_f">
     <fieldset>
       <legend>관련 사이트 이동</legend>
       <select name="rel_select">
         <option value="http://www.nl.go.kr">국립 중앙 도서관</option>
         <option value="http://www.nanet.go.kr">국회 도서관</option>
         <option value="http://www.dlibrary.go.kr">국가 전자 도서관</option>
       </select>
       <input type="image" src="${root}/images/rel_site_btn.gif" alt="관련 사이트 이동" />
     </fieldset>
   </form>
 </div>
 <address>
 
 <label style="font-family: 맑은 고딕; font-size:13px">경기 성남시 분당구 삼평동  유스페이스 802호,
 한국소프트웨어기술진흥협회<br/> <b>대표전화 (031) 398-2278 / 326-1723 이메일 lp0021@naver.com</b><br/> Copyright &copy; 
 2015-2016 꼬북꼬북. All Rights Reserved</label>
 
 </address>
</div>
</div>
</c:if>
<c:if test="${id!='admin'}">
	<script type="text/javascript">
		alert("관리자만 접근이 가능한 페이지 입니다");
		location.href="${root}/member/goBookMain.do"
	</script>
</c:if>
</body>
</html>
