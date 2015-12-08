<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
</head>
<body>
  
  <div align="center">
     <form class="form_style" action="${root}/bookUser/bookOrderList.do" method="post" onsubmit="" enctype="multipart/form-data">
       <input type="hidden" name="order_bunho" value="${order_bunho}"/>
     
     <div align="left">
         <label class="title">1. 주문 상품 목록</label>
         
<div class="container">					
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
			
<div class="container">			
 <div class="alert alert-success">
    <strong>배송지</strong>
   <div align="center">
  <label><input type="radio" name="optradio">주문자와 동일</label>&nbsp;&nbsp;&nbsp;
  <label><input type="radio" name="optradio">새로 입력</label>
</div>
	 
	 <div align="left">
	 <div class="form-group">
      <label for="addr">배송지 주소</label>
      <div class="line">
				<label class="title">우편번호</label>
				<span class="content">
					<input type="text" name="zipcode" />
					<input type="button" value="우편번호검색" onclick="zipcodeRead('${root}')"/>
					<input type="text" class="form-control" id="usr">
				</span>
		  	</div>
    </div>
      <label for="phone">전화번호</label>
      <input type="text" class="form-control" id="pwd">
    </div>
    
	 
	 </div>
  </div>    
</div>     
    
     <div align="left">
         <label class="title">3. 할인/적립 혜택</label>

		
<div class="container">
	<div class="alert alert-warning">			
			<div align="left">
				<label class="title">쿠폰</label>
				<span class="content">
					<input type="text" name="zipcode" />
					<input type="button" value="쿠폰적용" onclick="couponRead('${root}')"/><br/><br/>	
				</span>
			</div>
			<div align="left">	
				<label class="title">포인트사용</label>
				<span class="content">
					<input type="text" name="point" />
					<input type="text" name="point" value="10000"/>	
					
				</span>
			</div>
		</div>		
     </div>
 </div>

<div align="left">
         <label class="title">4. 결제정보</label>
<div class="container">
	<div class="alert alert-danger">
	<div align="left">			
			<label class="title">결제수단</label>
			<div align="center">
				<span class="content">
					 <label><input type="radio" name="optradio">신용카드</label>&nbsp;&nbsp;&nbsp;
                     <label><input type="radio" name="optradio">무통장입금</label>&nbsp;&nbsp;&nbsp;
                     <label><input type="radio" name="optradio">휴대폰 결제</label>&nbsp;&nbsp;&nbsp;
				</span> 
               </div>

<div class="container">
<label class="title">카드선택</label>
	<div class="dropdown">
  <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">카드사선택
  <span class="caret"></span></button>
    <ul class="dropdown-menu">
      <li><a href="#">국민은행</a></li>
      <li><a href="#">우리은행</a></li>
      <li><a href="#">농협</a></li>
      </ul>
  </div>
  <label class="title">할부기간</label>
  <div class="dropdown">
  <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">일시불
  <span class="caret"></span></button>
    <ul class="dropdown-menu">
      <li><a href="#">일시불</a></li>

      </ul>
  </div>
</div>
 	
       
       </div>
      </div>
 </div>
 </div> 
       <div class="line" style="width:498px; border-width:2px; text-align:center;">
				<input type="submit" value="주문" />
				
			</div>
     </form>
  </div>
</body>
</html>