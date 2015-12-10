<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${root}/script/jquery.js"></script>
<%-- <script type="text/javascript" src="${root}/script/userOrder/script.js"></script> --%>
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
</script>
<title>Insert title here</title>

</head>
<body>

<jsp:include page="../member/menu.jsp"/>
   <br/><br/>

	  <div align="center">
<%-- 		<c:if test="${count==0}">
			<div>
				<h3>주문한 목록이 없습니다.</h3>
			</div>
		</c:if>
		
		
		<c:if test="${count > 0}">  --%>
	<form class="form_style" action="${root}/userOrder/userOrderList.do"
		method="post" onsubmit="" enctype="multipart/form-data">
		<input type="hidden" name="order_bunho" value="${order_bunho}" />

		<div align="left">
			<label class="title">1. 주문 상품 목록</label>

			<div class="container" style="width: 50%">
				<table class="table table-bordered">
					<thead>
						<tr class="info">
							<th>책제목</th>
							<th>수량</th>
							<th>판매가</th>
						</tr>
					</thead>
					<tbody>
						<tr class="info">
							<td>정보처리기사2015</td>
							<td>3</td>
							<td>18000원</td>
						</tr>
						<tr class="info">
							<td>나의 라임 오렌지 나무</td>
							<td>1</td>
							<td>7000원</td>
						</tr>
						<tr class="info">
							<td>꼬북꼬북</td>
							<td>5</td>
							<td>50000원</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div align="left">
			<label class="title">2. 배송지 정보</label>

			<div class="container" style="width: 50%">
				<div class="alert alert-success">
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
									<input type="text" name="zipcode" /> 
									<input type="button" value="우편번호검색" onclick="zipcodeRead('${root}')" />
									<input type="text" class="form-control" id="usr">
								</span>
							</div>
						
						<label for="phone">전화번호</label> 
						<input type="text" class="form-control" id="hphone" value="">
						</div>
						
						<div id="old">		
							<div class="line">
								<label class="title">우편번호</label> 
								<span class="content">
									<input type="text" name="zipcode" /> 
									<input type="button" value="우편번호검색" onclick="zipcodeRead('${root}')" />
									<input type="text" class="form-control" id="usr" value="경기도 성남시 분당구 금곡동">
								</span>
							</div>
						
						<label for="phone">전화번호</label> 
						<input type="text" class="form-control" id="hphone" value="010-4166-5338">
						</div>
					</div>
				</div>
			</div>
		</div>
      </div>
     </div> 
		<div align="left">
			<label class="title">3. 할인/적립 혜택</label>


			<div class="container" style="width: 50%">
				<div class="alert alert-warning">
					<div align="left">
						<label class="title">쿠폰</label> <span class="content"> <input
							type="text" name="zipcode" /> <input type="button" value="쿠폰적용"
							onclick="couponRead('${root}')" /><br /> <br />
						</span>
					</div>
					<div align="left">
						<label class="title">포인트사용</label> <span class="content"> <input
							type="text" name="point"/> <input type="text" name="point"
							value="10000" />

						</span>
					</div>
				</div>
			</div>
		</div>

		<div align="left">
			<label class="title">4. 결제정보</label>
			<div class="container" style="width: 50%">
				<div class="alert alert-danger">
					<div align="left">
						<label class="title">결제수단</label>
						<div align="center">
							<span class="content"> 
								<label><input type="radio" name="pay" value="credit" id="c" checked>신용카드</label>&nbsp;&nbsp;&nbsp; 
								<label><input type="radio" name="pay" value="bank" id="b" >무통장입금</label>&nbsp;&nbsp;&nbsp;
								<label><input type="radio" name="pay" value="phone" id="p">휴대폰결제</label>&nbsp;&nbsp;&nbsp;
							</span>
						</div>

						<div class="container">
							<div id="card" >
								<label class="title">카드선택</label>
								<div class="dropdown">
									<button class="btn btn-primary dropdown-toggle"
										data-toggle="dropdown">
										카드사선택 <span class="caret"></span>
									</button>
									<ul class="dropdown-menu">
										<li><a href="#">국민카드</a></li>
										<li><a href="#">삼성카드</a></li>
										<li><a href="#">현대카드</a></li>
										<li><a href="#">신한카드</a></li>
									</ul>
								</div>
								<label class="title">할부기간</label>
								<div class="dropdown">
									<button class="btn btn-primary dropdown-toggle"
										data-toggle="dropdown">
										일시불 <span class="caret"></span>
									</button>
									<ul class="dropdown-menu">
										<li><a href="#">일시불</a></li>
									</ul>
								</div>
							</div>
							
							<div id="bank" >
								<label class="title">무통장선택</label>
								<div class="dropdown">
									<button class="btn btn-primary dropdown-toggle"
										data-toggle="dropdown">
										은행선택 <span class="caret"></span>
									</button>
									<ul class="dropdown-menu">
										<li><a href="#">국민은행 490302-04-052974 꼬북(강주혁)</a></li>
										<li><a href="#">우리은행 953455-07-388721 꼬북(강주혁)</a></li>
										<li><a href="#">농협 785591-38-421142 꼬북(강주혁)</a></li>
									</ul>
								  </div>
								</div>
								
							 <div id="phone" >
								<label class="title">휴대폰결제</label>
								   <span class="content">
									<input type="text" name="zipcode" /> 
									<input type="button" value="휴대폰인증" onclick="zipcodeRead('${root}')" /> 
								</span>
								</div>	
							</div>		
						</div>
					</div>
				</div>
			</div>
		
		<div align="center">
			<div class="line"
				style="width: 498px; border-width: 2px; text-align: center;">
				<input type="submit" value="주문" />

			</div>
		</div>
	</form>
	<%--  </c:if> --%> 
  </div>
</body>
</html>