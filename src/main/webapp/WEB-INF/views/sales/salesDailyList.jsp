<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<jsp:include page="../admin-top.jsp"/>
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
		$("#dailyDate").datepicker({
			 dateFormat:"yy/mm/dd",
			 monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			 dayNamesMin:["일","월","화","수","목","금","토"]
		 });
	});
</script>
</head>
<body>
    <div id="contents" style="height:100%; background:white; border:0px solid black; position: static;">
    <c:if test="${id!='admin'}">
		<h3 align="center">관리자 권한이 없습니다.</h3>
		<div align="center">
			<a href="${root}/">메인으로</a>
		</div>
	</c:if>
	
	<c:if test="${id=='admin'}">
		<div id="wrap" style="padding-bottom:80px">
		<div style="margin: -10px 0 0 1px;width: 999px;height: 40px;line-height: 40px;">
			<b style="font-size: 18px;">&nbsp;&nbsp;&nbsp;> 매출 관리</b>
		</div>
		
		<div align="left" style="width: 110px;float: left;">
			<jsp:include page="salesConNav.jsp"/>
		</div>
	
         <div align="center"><b style="font-size:18px">일일 매출</b></div>
         <br/>
			<div align="center">
				<form name="dayChoice" method="post" style="text-align:right">
					<label style="font-size:14px">날짜선택:</label>
					<input type="text" id="dailyDate" name="selectDate" style="font-size:14px" value="클릭 시 날짜 선택" onfocus="javascript:this.value=''"/>
					<c:set var="salesdaily_date" value="selectDate.value"/>
					<input type="button" id="clickDate" class="btn btn-success btn-sm" value="조회" onclick="selectToServer(${salesdaily_date}, '${root}')"/>
				</form><br/>
				
				<div id="dailyTable">
					<c:if test="${count == 0}">
						<div class="container" style="width:835px;padding:0px;margin-left:132px">
							<table class="table table-bordered">
								<thead>
									<tr class="success" style="color:#1DDB16">
										<th style="text-align:center;width:120px;font-size:14px">결제일</th>
										<th style="text-align:center;width:120px;font-size:14px">도서번호</th>
										<th style="text-align:center;width:120px;font-size:14px">도서명</th>
										<th style="text-align:center;width:120px;font-size:14px">도서원가</th>
										<th style="text-align:center;width:120px;font-size:14px">판매가</th>
										<th style="text-align:center;width:120px;font-size:14px">수량</th>
										<th style="text-align:center;width:120px;font-size:14px">판매총액</th>
										<th style="text-align:center;width:120px;font-size:14px">결제액</th>
										<th style="text-align:center;width:120px;font-size:14px">순이익</th>
									</tr>
								</thead>
								<tbody id="listAllTd"></tbody>
							</table>
						</div>
						<div style="width:835px;font-size:14px; padding-bottom:25px; border-bottom:2px solid #DDDDDD; margin-left:100px">일일매출 내역이 없습니다.</div>
					</c:if>
					
					<c:if test="${count > 0}">
						<c:if test="${calculCount > 0}">
							<script type="text/javascript">
								$(function(){
									$("#calculBtn").hide();
									$("<b style='font-size:18px'>정산완료</b>").insertBefore("#calculBtn");
								});
							</script>
						</c:if>
						<div class="container" style="width:835px;padding:0px">
							<table class="table table-bordered" style="line-height: 100px; border:0px solid red; margin-left:50px;">
								<thead>
									<tr class="success" align="center" style="color:#1DDB16;">
										<th style="text-align:center;font-size:13px">결제일</th>
										<th style="text-align:center;font-size:13px">도서번호</th>
										<th style="text-align:center;font-size:13px">도서명</th>
										<th style="text-align:center;font-size:13px">도서원가</th>
										<th style="text-align:center;font-size:13px">판매가</th>
										<th style="text-align:center;font-size:13px">수량</th>
										<th style="text-align:center;font-size:13px">판매총액</th>
										<th style="text-align:center;font-size:13px">결제액</th>
										<th style="text-align:center;font-size:13px">순이익</th>
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
											<td style="font-size:13px"><fmt:formatDate value="${salesDaily.salesdaily_date}" type="both" pattern="yy/MM/dd HH:mm:ss"/></td>
											<td style="font-size:13px">${salesDaily.book_num}</td>
											<td style="font-size:13px">
												<c:choose>
													<c:when test="${fn:length(salesDaily.salesdaily_book_name) > 10}">
														<c:out value="${fn:substring(salesDaily.salesdaily_book_name, 0, 9)}"/>....
													</c:when>
													<c:otherwise>
														${salesDaily.salesdaily_book_name}
													</c:otherwise>
												</c:choose>
											</td>
											<td style="text-align:right;font-size:13px"><fmt:formatNumber value="${salesDaily.salesdaily_book_cost}" groupingUsed="true"/>원</td>
											<td style="text-align:right;font-size:13px"><fmt:formatNumber value="${salesDaily.salesdaily_book_price}" groupingUsed="true"/>원</td>
											<td style="text-align:center;font-size:13px">${salesDaily.salesdaily_quantity}</td>
											<td style="text-align:right;font-size:13px"><fmt:formatNumber value="${salesDaily.salesdaily_total}" groupingUsed="true"/>원</td>
											<td style="text-align:right;font-size:13px"><fmt:formatNumber value="${salesDaily.salesdaily_pay}" groupingUsed="true"/>원</td>
											<td style="text-align:right;font-size:13px"><fmt:formatNumber value="${salesDaily.salesdaily_profit}" groupingUsed="true"/>원</td>
										</tr>
									</c:forEach>
									
								</tbody>
							</table>
						</div>
						
						<hr width="70%" color="blue"/>
						<div align="right" id="order" style="width: 950px">
							<span id="daily_sum" style="font-size: 18px;"><b>일일 매출액 : <fmt:formatNumber value="${dailySum}" groupingUsed="true"/> 원</b></span>&nbsp;&nbsp;&nbsp;
							<b style="font-size:18px">일일 순이익 : <span id="daily_profit" style="font-size: 18px;color:blue"><fmt:formatNumber value="${dailyProfit}" groupingUsed="true"/></span> 원</b>&nbsp;&nbsp;&nbsp;&nbsp;
						</div><br/>
						
						<div align="right" style="margin-right:45px">
							<input type="button" id="calculBtn" class="btn btn-success btn-sm" value="정산하기" onclick="salesMonthlyInsert(${dailySum}, ${dailyProfit}, '${dailyUpdate}', '${root}')"/>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</c:if>
	</div>
<jsp:include page="../main-bottom.jsp"/>	
</body>
</html>