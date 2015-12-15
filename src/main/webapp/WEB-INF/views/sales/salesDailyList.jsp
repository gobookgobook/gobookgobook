<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<script type="text/javascript" src="${root}/script/sales/jquery.js"></script>
<script type="text/javascript" src="${root}/script/sales/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/script/sales/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="${root}/css/sales/style.css"/>
<script type="text/javascript" src="${root}/script/sales/script.js"></script>
<script type="text/javascript">
	$(function(){
		$("#date").datepicker({
			 dateFormat:"yy/mm/dd",
			 monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			 dayNamesMin:["일","월","화","수","목","금","토"]
		 });
	});
</script>
</head>
<body>
	<jsp:include page="../member/menu.jsp"/>
    <br/><br/>
    
    <c:if test="${id!='admin'}">
		<h3 align="center">관리자 권한이 없습니다.</h3>
		<div align="center">
			<a href="${root}/">메인으로</a>
		</div>
	</c:if>
	
	<c:if test="${id=='admin'}">
		<div id="wrap">
		<div id="header">
			<h1>GoBook!GoBook!</h1>
		</div>
		
		<div id="nav">
			<a href="${root}/sales/salesDailyList.do"><b> 매출관리 </b></a><br/>
		</div>
	
		<div id="con1" align="left" style="height:100px;">
			<jsp:include page="salesConNav.jsp"/>
		</div>
	
		<div id="#con2" align="left" >
			<h3>일일매출</h3>
			<div align="center" style="border:0 solid red">
				<form name="dayChoice" method="post">
					<label>날짜선택:</label>
					<input type="text" id="date" name="selectDate"/>
					<c:set var="salesdaily_date" value="selectDate.value"/>
					<input type="button" id="clickDate" class="btn btn-success btn-sm" value="조회" onclick="selectToServer(${salesdaily_date}, '${root}')"/>
				</form>
				
				<div id="dailyTable">
					<c:if test="${count == 0}">
						<div class="container" style="width:85%">
							<table class="table table-bordered">
								<thead>
									<tr class="success" align="center" style="color:#1DDB16">
										<th>결제일</th>
										<th>도서번호</th>
										<th>도서명</th>
										<th>도서원가</th>
										<th>판매가</th>
										<th>수량</th>
										<th>판매총액</th>
										<th>결제액</th>
										<th>순이익</th>
									</tr>
								</thead>
								<tbody id="listAllTd"></tbody>
							</table>
						</div>
						<span>일일매출 내역이 없습니다.</span>
						<hr width="80%" color="blue"/>
					</c:if>
					
					<c:if test="${count > 0}">
						<c:if test="${calculCount > 0}">
							<script type="text/javascript">
								$(function(){
									$("#calculBtn").hide();
									$("<h3>정산완료</h3>").insertBefore("#calculBtn");
								});
							</script>
						</c:if>
						<div class="container" style="width:85%; border:0px solid red; margin:0 auto">
							<table class="table table-bordered" style="line-height: 100px">
								<thead>
									<tr class="success" align="center" style="color:#1DDB16">
										<th>결제일</th>
										<th>도서번호</th>
										<th>도서명</th>
										<th>도서원가</th>
										<th>판매가</th>
										<th>수량</th>
										<th>판매총액</th>
										<th>결제액</th>
										<th>순이익</th>
									</tr>
								</thead>
								<tbody id="listAllTd">
								<c:set var="dailySum" value="0"/>
								<c:set var="dailyProfit" value="0"/>
									<c:forEach var="salesDaily_total" items="${salesDailyList}">
										<c:set var="dailySum" value="${dailySum+salesDaily_total.salesdaily_total}"/>
										<c:set var="dailyProfit" value="${dailyProfit+salesDaily_total.salesdaily_profit}"/>
										<c:set var="dailyDate" value="${salesDaily_total.salesdaily_date}"/>
									</c:forEach>
									
									<fmt:formatDate value="${dailyDate}" type="date" pattern="yy/MM/dd" var="dailyUpdate"/>	<!-- date를 원하는 형태의 String으로 변환 -->
									
									<c:forEach var="salesDaily" items="${salesDailyList}">
										<tr class="success" id="${salesDaily.salesdaily_num}">
											<td><fmt:formatDate value="${salesDaily.salesdaily_date}" type="both" pattern="yy/MM/dd HH:mm:ss"/></td>
											<td>${salesDaily.book_num}</td>
											<td>${salesDaily.salesdaily_book_name}</td>
											<td><fmt:formatNumber value="${salesDaily.salesdaily_book_cost}" groupingUsed="true"/>원</td>
											<td><fmt:formatNumber value="${salesDaily.salesdaily_book_price}" groupingUsed="true"/>원</td>
											<td>${salesDaily.salesdaily_quantity}</td>
											<td><fmt:formatNumber value="${salesDaily.salesdaily_total}" groupingUsed="true"/>원</td>
											<td><fmt:formatNumber value="${salesDaily.salesdaily_pay}" groupingUsed="true"/>원</td>
											<td><fmt:formatNumber value="${salesDaily.salesdaily_profit}" groupingUsed="true"/>원</td>
										</tr>
									</c:forEach>
									
								</tbody>
							</table>
						</div>
						
						<hr width="70%" color="blue"/>
						<div align="left" id="order" style="width:75%">
							<span id="daily_sum">일일 매출액:<fmt:formatNumber value="${dailySum}" groupingUsed="true"/>원</span>&nbsp;&nbsp;&nbsp;
							<span id="daily_profit">일일 순이익:<fmt:formatNumber value="${dailyProfit}" groupingUsed="true"/>원</span>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" id="calculBtn" class="btn btn-success btn-sm" value="정산하기" onclick="salesMonthlyInsert(${dailySum}, ${dailyProfit}, '${dailyUpdate}', '${root}')"/>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	</c:if>
	
</body>
</html>