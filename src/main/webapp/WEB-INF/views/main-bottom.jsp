<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
</head>
<body>
<div id="footer_wrap" style="width:1000px; height:150px; position:static; border-top: 1px solid #37415a; margin: 10px auto;">
<hr size="3px">
<div id="inner_footer" style="width:90%; height:150px; margin-top:-40px; position:relative; border:0px solid #37415a;">
 <h3 class="footer_logo">
    <a href="${root}/"><img src="${root}/images/logomain.png" alt="로고" style="	position:absolute;left:100px; bottom:-10px; border:0px solid red;width:150px;height:90px; ma"/></a>
 </h3>
 <div id="relSite_wrap" style=" border: 0px solid black; left: 790px;top:70px;">
   <h3><img src="${root}/images/rel_site_title.gif" alt="관련 사이트 이동하기"/></h3>
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

 <label style="border:0px solid red; position:absolute; left :300px;bottom:-30px; margin-bottom:30px;">경기 성남시 분당구 삼평동  유스페이스 802호,한국소프트웨어기술진흥협회<br/> <b>대표전화 (031) 398-2278 / 326-1723 이메일 lp0021@naver.com</b><br/> Copyright &copy; 
 2015-2016 꼬북꼬북. All Rights Reserved<br/>
 LG U+ 구매안전서비스 : 고객님은 안전거래를 위해 현금 등으로 결제시<br/> 저희 쇼핑몰에서 가입한 LG유플러스의 구매안전서비스를 이용하실 수 있습니다</label>
 
 </address>
</div>
</div>
</body>
</html>