<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/userBook/userBookRead.css"/>
<script type="text/javascript" src="${root}/script/jquery.js"></script>
<script type="text/javascript" src="${root}/script/userBook/script.js"></script>
<script type="text/javascript">
	$(function(){
		$("#groupPurchaseAsk").one("click", function(){
			$(this).fadeOut();
		});
	});
	$(function(){
		$("#soldOutAsk").one("click", function(){
			$(this).fadeOut();
		});
	});
</script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="${root}/script/star/jquery.raty.js"></script>
<script type="text/javascript">
	$(function() {
	    $('div#star').raty({
	        score: $('#displayStarRating').html(),
	        path : "${root}/css/star",
	        width : 130,
	        readOnly : true,
	        scoreName: $('#displayStarRating').html()
	    });
	    $('div#inputstar').raty({
	        score: 0,
	        path : "${root}/css/star",
	        width : 130,
	        click: function(score, evt) {
                $("#userstar").html(score);
            }

	    });
	});
</script>
</head>
<body>
	<div class="book_read">
	<div class="book_top">	
		<div class="book_cover">
			<div>
			표지
			</div>
			<div>
			미리보기
			</div>
			<div>
				<div id="star"></div>
		        <div style="padding-top:20px;">
		            <label>Value : </label><span id="displayStarRating" style="padding-left:20px;">${bookDto.book_star}</span>
		        </div>
		     
		     <c:if test="${order_bunho > 0}">   
		        <div id="inputstar"></div>
		        <span id="userstar"></span>
		        <input type="button" value="전송" onclick="userbookstar_star('${root}', '${bookDto.book_num}')"/>
		     </c:if>
			</div>
		</div>
		<div class="book_info">
			<div class="info">
				<label class="book_title">제목 : </label>
				<span class="book_content">${bookDto.book_name}</span>
			</div>
			<div class="info">
				<label class="book_title">저자 : </label>
				<span class="book_content">${bookDto.book_writer}</span>
			</div>
			<div>
				<label class="book_title">출판사 : </label>
				<span class="book_content">${bookDto.book_publisher}</span>
			</div>
			<div class="info">
				<label class="book_title">출판연도 : </label>
				<span class="book_content"><fmt:formatDate value="${bookDto.book_publish_date}" pattern="yyyy-MM-dd"/>
				</span>
			</div>
			<div class="info">
				<label class="book_title">판매가 : </label>
				<span class="book_content">${bookDto.book_price}</span>
			</div>
			<div class="info">
				<label class="book_title">수량 : </label>
				<span class="book_content">
				<select id="book_quantity">
					<c:forEach var="i" begin="1" end="${bookDto.book_quantity}">
						<option value="${i}" id="quantity">${i}</option>
					</c:forEach>
				</select>
				/${bookDto.book_quantity}</span>
			</div>
			<div>
			<c:if test="${id !='admin' }">
				<input type="button" value="장바구니" onclick="myBasket('${root}', '${bookDto.book_num}', '${bookDto.book_name}', '${bookDto.book_price}')"/>
				<input type="button" value="구매" onclick="" />
			<!-- 수량 없을때 if문 처리 해주자-->	
				<input type="button" value="재입고" id="soldOutAsk" onclick="soldOutAsk('${root}', '${bookDto.book_num}')"/>
				<input type="button" value="공동구매" id="groupPurchaseAsk" onclick="groupPurchaseAsk('${root}', '${bookDto.book_num}')"/>
			</c:if>
			<c:if test="${id =='admin' }">
				<input type="button" value="공동구매등록" id="" onclick=""/>
			</c:if>
			</div>				
		</div>
	</div>
	<div class="book_index">
	${bookDto.book_index}
	</div>
	<div class="book_summary">
	${bookDto.book_summary}
	</div>
	</div>
</body>
</html>