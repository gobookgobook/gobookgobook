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
          <input type="image" src="${root}/images/gnb_search3.png" alt="검색" style="width:50px; height:33px; position:absolute; top:0px; left:300px;"/>
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
     <li><a href="${root}/myPage/myPageCoupon.do"><img src="${root}/images/gnb_5_pic.png" alt="MyPage" style="width:100px; height:40px;"/></a>
        <ul class="sub2">
           <li><a href="${root}/myPage/myPageCoupon.do">쿠폰함</a></li>
           <li><a href="${root}/myPage/myPagePoint.do">포인트함</a></li>
           <li><a href="${root}/myPage/">주문내역</a></li>
        </ul>
        
     </li>
    
     
     <li><a href="${root}/userHelp/userHelpNotice.do"><img src="${root}/images/gnb_6_pic.png" alt="고객센터" style="width:100px; height:40px;"/></a>
        <ul class="sub3">
           <li><a href="${root}/userHelp/userHelpQnA.do">Q&A</a></li>
           <li><a href="${root}/userHelp/userHelpNotice.do">공지사항</a></li>
           <li><a href="${root}/userHelp/userHelpLocation.do">지점 확인</a></li>
        </ul>
     </li>
  </ul>
</div>
</div>
</body>
</html>