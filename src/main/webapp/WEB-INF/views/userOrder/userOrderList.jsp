<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${root}/script/jquery.js"></script>
<script type="text/javascript" src="${root}/script/userOrder/script.js"></script>
<script type="text/javascript">
	$(function(){
		$("#bank").hide();
		$("#phone").hide();
		
		$("#c").click(function(){
			$("#bank").hide();	
			$("#phone").hide();
			$("#card").show();
		});
		
		$("#b").click(function(){
			$("#card").hide();
			$("#phone").hide();
			$("#bank").show();
		});
		
		$("#p").click(function(){
			$("#card").hide();
			$("#bank").hide();
			$("#phone").show();
		});
	});
	
	$(function(){
		$("#new").hide();
		
		$("#n").click(function(){
			$("#old").hide();
			$("#new").show();
		});
		
		$("#o").click(function(){
			$("#new").hide();
			$("#old").show();
		});
	});
	
	function authPhone(){
		alert("휴대폰 인증이 정상적으로 처리되었습니다.");
		$(function(){
			$("#authPhoneNum").attr("disabled", true);
		});
	}
</script>
<title>Insert title here</title>
	<jsp:include page="../main-top.jsp"/>
</head>
<body>
	
	<br/><br/><br/><br/><br/><br/>
	
	<div align="center">
		<c:if test="${id==null}">		<!-- 비회원이 책 즉시구매를 눌렀을 경우 -->
			<h3 align="center">회원만 주문이 가능합니다.</h3>
			<div align="center">
				<a href="${root}/member/register.do">회원가입</a> <a href="${root}/member/login.do">로그인</a>
			</div>
		</c:if>
		
		<c:if test="${id!=null}">
			<c:if test="${purchase!='basket' && purchase!='immediately'}">	<!-- 회원이 주문을 안누른 상태로 주문내역에 들어왔을 경우 -->	
				<div class="container" style="width:100%">
					<table class="table table-bordered">
						<thead>
							<tr class="info">
								<th>책제목</th>
								<th>판매가</th>
								<th>수량</th>
								<th>합계</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					<h3>주문한 목록이 없습니다.</h3>
				</div>
			</c:if>
			
			
			<form class="form_style" name="memberForm" action="${root}/userOrder/userOrderPay.do" method="post" onsubmit="return userOrderForm(this)">
				<c:if test="${purchase=='basket'}">			<!-- 장바구니에서 주문했을 경우 뿌려주는 주문 리스트 -->
					<div align="left" style="width:50%">
						<label class="title">1. 주문 상품 목록</label>
						
						<div class="container" style="width:100%">
							<table class="table table-bordered">
								<thead>
									<tr class="info">
										<th>책제목</th>
										<th>판매가</th>
										<th>수량</th>
										<th>합계</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="sum" value="0"/>
									<c:forEach var="myBasketOrder_total" items="${myBasketOrderList}">
										<c:set var="sum" value="${sum+myBasketOrder_total.basket_total_price}"/>
									</c:forEach>
									
									<c:forEach var="myBasketOrder" items="${myBasketOrderList}">
									<c:set var="point" value="${myBasketOrder.basket_book_price*0.03}"/>	
										<tr class="info" id="${myBasketOrder.basket_num}">
											<td>${myBasketOrder.basket_book_name}</td>
											<td>
												<fmt:formatNumber value="${myBasketOrder.basket_book_price}" groupingUsed="true"/>원
												 &nbsp;(<fmt:formatNumber value="${point}" groupingUsed="true" pattern="#"/> &nbsp;P)
											</td>
											<td>${myBasketOrder.basket_quantity}</td>
											<td id="totalPrice${myBasketOrder.basket_num}"><fmt:formatNumber value="${myBasketOrder.basket_total_price}" groupingUsed="true"/>원</td>
										</tr>
									</c:forEach>
									
									<c:set var="point_sum" value="${sum*0.03}"/>
								</tbody>
							</table>
						</div><br/><br/>
						
						<hr width="50%" color="blue"/>
						<div align="right" id="order" style="width:98%">
							<span id="point_sum" style="font-size: 20px">포인트 총 적립액:<fmt:formatNumber value="${point_sum}" groupingUsed="true"/>원</span>&nbsp;&nbsp;&nbsp;
							<span id="sum" style="font-size: 20px">상품 총 금액:<fmt:formatNumber value="${sum}" groupingUsed="true"/>원</span>
						</div><br/><br/>
					</div>
				</c:if>
				<c:if test="${purchase=='immediately'}">	<!-- 즉시구매일 경우 뿌려주는 구매 리스트 -->
					<div align="left" style="width:50%">
						<label class="title">1. 주문 상품 목록</label>
						
						<div class="container" style="width:100%">
							<table class="table table-bordered">
								<thead>
									<tr class="info">
										<th>책제목</th>
										<th>판매가</th>
										<th>수량</th>
										<th>합계</th>
									</tr>
								</thead>
								<tbody>								
									
									<c:set var="point" value="${book_price*0.03}"/>	
										<tr class="info" id="${book_num}">
											<td>${book_name}</td>
											<td>
												<fmt:formatNumber value="${book_price}" groupingUsed="true"/>원
												 &nbsp;(<fmt:formatNumber value="${point}" groupingUsed="true" pattern="#"/> &nbsp;P)
											</td>
											<td>${book_quantity}</td>
											<td id="${sum}"><fmt:formatNumber value="${sum}" groupingUsed="true"/>원
											<input type="hidden" name="book_num" value="${book_num}"/>
											<input type="hidden" name="order_book_name" value="${book_name}"/>
											<input type="hidden" name="order_book_price" value="${book_price}"/>
											<input type="hidden" name="order_book_count" value="${book_quantity}"/>
										</tr>
									
									
									<c:set var="point_sum" value="${sum*0.03}"/>
								</tbody>
							</table>
						</div><br/><br/>
						
						<hr width="50%" color="blue"/>
						<div align="right" id="order" style="width:98%">
							<span id="point_sum" style="font-size: 20px">포인트 총 적립액:<fmt:formatNumber value="${point_sum}" groupingUsed="true"/>원</span>&nbsp;&nbsp;&nbsp;
							<span id="sum" style="font-size: 20px">상품 총 금액:<fmt:formatNumber value="${sum}" groupingUsed="true"/>원</span>
						</div><br/><br/>
					</div>
				</c:if>
					
					<div align="left" style="width:50%">
						<label class="title">2. 배송지 정보</label>
			
						<div class="container" style="width: 100%">
							<div class="alert alert-info">
								<div align="left">
									<div class="form-group">
										<label for="addr">배송지 주소</label>
										<div align="center">
											<span class="content"> 
												<label><input type="radio" name="address" value="old" id="o" checked>기존 배송지</label>&nbsp;&nbsp;&nbsp; 
												<label><input type="radio" name="address" value="new" id="n" >새로 입력</label>&nbsp;&nbsp;&nbsp;
											</span>
											
											<div id="new">		
												<div class="line">
													<label class="title">우편번호</label>
													<span class="content">
														<input type="text" name="zipcodeDisp" disabled="disabled"/>
														<input type="hidden" name="member_zipcode"/>
														<input type="button" name="zipcodeBtn" value="우편번호검색" onclick="zipcodeRead('${root}')"/>
													</span>
											  	</div>
												
												<div class="line">
													<span class="content">
														<input type="text" class="form-control" name="address1Disp" size="48" disabled="disabled"/>
														<input type="hidden" name="member_address1"/>
													</span>
												</div>
												
												<div class="line">
													<span class="content">
														<input type="text" class="form-control" name="member_address2" size="48" />
													</span>
												</div>
										
												<label for="phone">전화번호</label> 
												<input type="text" class="form-control" id="hphone" name="member_phone" value="">
											</div>
									
											<div id="old">		
												<div class="line">
													<label class="title">우편번호</label>
													<span class="content">
														<input type="text" name="oldZipcodeDisp" value="${memberDto.member_zipcode}" disabled="disabled"/>
														<input type="hidden" name="order_zipcode" value="${memberDto.member_zipcode}"/>
													</span>
											  	</div>
												
												<div class="line">
													<span class="content">
														<input type="text" class="form-control" name="oldAddress1Disp" size="48" value="${memberDto.member_address1}" disabled="disabled"/>
														<input type="hidden" name="order_book_user_address1" value="${memberDto.member_address1}"/>
													</span>
												</div>
												
												<div class="line">
													<span class="content">
														<input type="text" class="form-control" name="old_address2" value="${memberDto.member_address2}" size="48" />
														<input type="hidden" name="order_book_user_address2"/>
													</span>
												</div>
											
												<label for="phone">전화번호</label> 
												<input type="text" class="form-control" id="oldHphone" name="old_phone" value="${memberDto.member_phone}">
												<input type="hidden" name="order_book_user_number"/>
											</div>
										</div>
									</div>
								</div>
							</div>
			     		</div>
			    	</div> 
			    	
					<div align="left" style="width:50%">
						<label class="title">3. 할인/적립 혜택</label>
			
						<div class="container" style="width: 100%">
							<div class="alert alert-info">
								<div align="left">
									<label class="title">쿠폰</label> 
									<span class="content"> 
										<input type="hidden" name="order_user_coupon_num"/>
									</span>
									<span class="content"> 
										<input type="text" name="couponNameDisp" disabled="disabled"/>
										<input type="hidden" name="order_user_coupon_name"/>
									</span>
									<span class="content" id="coupon_halin">
										<label>할인:</label>
										<input type="text" name="couponDiscountDisp" value="0" size="8" disabled="disabled"/>
										<input type="hidden" name="coupon_discount"/> 
										<input type="button" id="coupon_btn" name="coupon_button" value="쿠폰적용" onclick="couponRead('${root}')"/>
										(쿠폰은 최대 1개만 적용 가능합니다.)<br/><br/>
									</span>
								</div>
								<div align="left">
									<label class="title">포인트 사용</label><br/>
									<span class="content"> 
										적용하실 포인트 : <input type="text" size="10" id="point" value="0" name="order_book_point_disp"/> Point (포인트는 100 Point이상단위부터 사용가능합니다.)<br/>
										보유하신 포인트 : <input type="text" name="equipPoint" size="10" value="${memberDto.member_point}" disabled="disabled"/> Point<br/><br/>
										<input type="hidden" name="order_book_point" value="0"/>
											<span id="applyPointDisp">적용된 포인트 : 0 Point</span>
										<input type="button" name="payPoint" value="포인트적용" onclick="applyPoint('${root}',order_book_point_disp,equipPoint,order_book_point)"/>
									</span>
								</div>
							</div>
						</div>
					</div>
			
					<div align="left" style="width:50%">
						<label class="title">4. 결제총액</label>
			
						<div class="container" style="width: 100%">
							<div class="alert alert-info">
								<div align="left">
									<label class="title">상품 총 금액 : </label>
									<span class="content"> 
										<fmt:formatNumber value="${sum}" groupingUsed="true"/>원
									</span><br/><br/>
									
									<label class="title">포인트 적립액 : </label>
									<span class="content"> 
										<fmt:formatNumber value="${point_sum}" groupingUsed="true"/>원
										<input type="hidden" name="allBookPoint" value="${point_sum}"/>
									</span><br/><br/>
									
									<label class="title">쿠폰 할인 금액 : </label> 
									<span class="content" id="applyCouponCharge"> 
										0 원
									</span><br/><br/>
									
									<label class="title">포인트 할인 금액 : </label> 
									<span class="content" id="applyPointCharge"> 
										0원
									</span><br/><br/><br/>
									
									<label class="title">최종 결제 금액 : </label> 
									<span class="content" id="applyTotalCharge" > 
										<fmt:formatNumber value="${sum}" groupingUsed="true"/>원
									</span><br/><br/>
									<input type="hidden" value="${sum}" name="total"/>
								</div>
							</div>
						</div>
					</div>
			
					<div align="left" style="width:50%">
						<label class="title">5. 결제정보</label>
						<div class="container" style="width: 100%">
							<div class="alert alert-info">
								<div align="left">
									<label class="title">결제수단</label>
									<div align="center">
										<span class="content"> 
											<label><input type="radio" name="order_book_charge" value="신용카드" id="c" checked>신용카드</label>&nbsp;&nbsp;&nbsp; 
											<label><input type="radio" name="order_book_charge" value="무통장입금" id="b" >무통장입금</label>&nbsp;&nbsp;&nbsp;
											<label><input type="radio" name="order_book_charge" value="휴대폰결제" id="p">휴대폰결제</label>&nbsp;&nbsp;&nbsp;<br/><br/>
										</span>
									</div>
									
									<div class="container" style="width: 50%">
										<form role="form">
											<div id="card" class="form-group">
												<label class="title" for="cardSel1">카드선택</label>
												<select class="form-control" id="cardSel1">
													<option>국민카드</option>
													<option>삼성카드</option>
													<option>현대카드</option>
													<option>신한카드</option>
												</select><br/>
												<label class="title" for="cardSel2">할부기간</label>
												<select class="form-control" id="cardSel2">
													<option>일시불</option>
												</select>
											</div>
											
											<div id="bank">
												<label class="title" for="bankSel">계좌선택</label>
												<select class="form-control" id="bankSel">
													<option>국민은행 490302-04-052974 꼬북(강주혁)</option>
													<option>우리은행 953455-07-388721 꼬북(강주혁)</option>
													<option>농협 785591-38-421142 꼬북(강주혁)</option>
												</select>
										
											</div>
												
											 <div id="phone">
												<label class="title">휴대폰결제</label>
												   <span class="content">
													<input type="text" name="authPhoneNum" id="authPhoneNum"/> 
													<input type="button" value="휴대폰인증" onclick="authPhone()" /> 
												</span>
											</div>	
										</form>
									</div>		
								</div>
							</div>
						</div>
						
						<div class="line" style="width: 498px; border-width: 2px; text-align: center;">
							<input type="submit" class="btn btn-primary" value="주문" />
						</div>
						
						<br/><br/>
					</div>
				</form>
		</c:if>
  </div>
<jsp:include page="../main-bottom.jsp"/>  
</body>
</html>