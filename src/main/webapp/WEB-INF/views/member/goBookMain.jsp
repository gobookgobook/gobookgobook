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
<jsp:include page="../cookie/cookie.jsp"/>
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
           
           <c:if test="${id==null}">
           <li>
            <a href="${root}/member/register.do">회원가입</a>
           </li>
           <li>
            <a href="${root}/member/login.do">로그인</a>
           </li>
           <li>
            <a href="${root}/myBasket/myBasketList.do">장바구니</a>
           </li>
           <li>
            <a href="${root}/myPage/myPageOrderList.do">MyPage</a>
           </li>
           </c:if>
           
           <c:if test="${id!=null}">
         <%--  <li>
				<a href="${root}/member/update.do">회원수정</a>
			</li>
			<li>
				<a href="${root}/member/delete.do">회원탈퇴</a>
			</li> --%>
			<li>
				<a href="${root}/member/logout.do">로그아웃</a>
			</li>
			<li>
				<a href="${root}/myPage/myPageOrderList.do">myPage</a>
			</li>
			<li>
				<a href="${root}/myBasket/myBasketList.do">장바구니</a>
			</li>
				<c:if test="${id=='admin'}">
					<li><a href="${root}/member/adminMain.do">관리자&nbsp;&nbsp;&nbsp;</a></li>
				</c:if>
           </c:if>
        </ul>
     </dd>
  </dl>
  <form action="${root}/userBook/userBookSerch.do" method="get" name="sch_f" id="sch_f">
     <fieldset>
        <legend>검색폼</legend>
        <p>
           <input type="text" name="keyword" id="keyword" title="검색어입력 " onkeydown="startSuggest('${root}')"/>
           <input type="image" src="${root}/images/gnb_search.png" alt="검색" style="width:70px; height:33px; position:absolute; top:0px; left:308px"/>
        </p>
        <div id="suggest" style="display:; postion: absolute; left: 0px; top: 30px;">
			<div id="suggestList"></div>
		</div>
     </fieldset>
  </form>
  <h2 class="hide">메인메뉴</h2>
   <ul id="gnb">
     <li><a href="${root}/userBook/userBookList.do?category=${'문학'}"><img src="${root}/images/gnb_1_pic.png" alt="카테고리" style="width:100px; height:40px;"/></a>
        <ul class="sub1">
           	<li><a href="${root}/userBook/userBookList.do?category=${'문학'}">문학</a></li>
			<li><a href="${root}/userBook/userBookList.do?category=${'교육도서'}">교육도서</a></li>
			<li><a href="${root}/userBook/userBookList.do?category=${'전공도서'}">전공도서</a></li>
			<li><a href="${root}/userBook/userBookList.do?category=${'만화'}">만화</a></li>
			<li><a href="${root}/userBook/userBookList.do?category=${'잡지'}">잡지</a></li>
			<li><a href="${root}/userBook/userBookList.do?category=${'역사'}">역사</a></li>
			<li><a href="${root}/userBook/userBookList.do?category=${'SF/판타지'}">SF/판타지</a></li>
			<li><a href="${root}/userBook/userBookList.do?category=${'교양도서'}">교양도서</a></li>
        </ul>
     </li>
      <li><a href="${root}/userBook/userBookGroupPurchaseList.do"><img src="${root}/images/gnb_2_pic.png" alt="공동구매" style="width:100px; height:40px;"/></a>
     </li>
     <li><a href="${root}/userBook/userBookInterestReading.do"><img src="${root}/images/gnb_3_pic.png" alt="관심분야 추천" style="width:100px; height:40px;"/></a>
     </li>
     <li><a href="${root}/myBasket/myBasketList.do"><img src="${root}/images/gnb_4_pic.png" alt="장바구니" style="width:100px; height:40px;"/></a>
     </li>
     <li><a href="${root}/userHelp/userHelpNotice.do"><img src="${root}/images/gnb_5_pic.png" alt="MyPage" style="width:100px; height:40px;"/></a>
        <ul class="sub2">
           <li><a href="${root}/myPage/myPageCoupon.do">쿠폰함</a></li>
           <li><a href="${root}/myPage/myPagePoint.do">포인트함</a></li>
           <li><a href="${root}/myPage/">주문내역</a></li>
        </ul>
        
     </li>
    
     
     <li><a href="${root}/member/update.do"><img src="${root}/images/gnb_6_pic.png" alt="고객센터" style="width:100px; height:40px;"/></a>
        <ul class="sub3">
           <li><a href="${root}/userHelp/userHelpQnA.do">Q&A</a></li>
           <li><a href="${root}/userHelp/userHelpNotice.do">공지사항</a></li>
           <li><a href="${root}/userHelp/userHelpLocation.do">지점 확인</a></li>
        </ul>
     </li>
  </ul> 
</div>
<hr />
<div id="visual">
 <div id="mySwipe"  class='swipe'>
    <ul class="touch_banner swipe-wrap"> <!-- 배너 목록 -->
      <li style="margin-left:-10px;"><a href="${root}/event/eventRead.do?event_bunho=2"><img src="${root}/images/이벤트7.jpg" alt=""/></a></li>
      <li><a href="${root}/event/eventRead.do?event_bunho=3"><img src="${root}/images/이벤트8.jpg" alt=""/></a></li>
      <li><a href="${root}/event/eventRead.do?event_bunho=4"><img src="${root}/images/이벤트9.jpg" alt=""/></a></li>
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
      <img src="${root}/images/bestbook_title.gif" alt="베스트셀러" />
   </h3>
   <div id="best_bg">
      <ul>
		<c:forEach var="bestSeller" items="${bestSeller}">
			<li>
				<img src="#" alt="" onclick="javascript:userBookRead('${root}', '${bestSeller.book_num}')" width=120px; height="100px;"/>
				<span><strong>${bestSeller.book_name}</strong></span>
				<span><strong>${bestSeller.book_writer}</strong></span>
			</li>      	
		</c:forEach>
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
</body>
</html>
