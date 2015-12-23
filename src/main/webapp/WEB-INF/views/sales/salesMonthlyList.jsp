<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:set var="date" value="<%=new Date() %>"/>
<fmt:formatDate var="today" value="${date}" pattern="yyyy"/>
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
</head>
<body>
    <div id="contents" style="height:100%;background:white; border:0px solid black; ">
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
			
            <div align="center"><b style="font-size:18px">월별 매출</b></div>
              <br/>
				<div align="center" style="border:0 solid red">
					<form name="monthChoice" method="get" action="${root}/sales/salesMonthlyList.do" style="text-align:right">
						<label>년월 선택:</label>
						<span class="content">
							<select name="monthly_year" onfocus="javascript: this.value='${today}'">
								<option>년</option>
								<c:forEach var="year" begin="2000" end="${today}">
								<option value="${year}">${year}</option>
								</c:forEach>
							</select>
							
							<select name="monthly_month">
								<option>월</option>
								<c:forEach var="month" begin="1" end="12">
								<option value="${month}">${month}</option>
								</c:forEach>
							</select>
						</span>
						<input type="submit" id="clickDate" class="btn btn-success btn-sm" value="조회"/>
					</form><br/>
					
					<div id="monthlyTable">
						<c:if test="${count ==0}">
							<div class="container" style="width:835px;padding:0px; position: static;margin-left:132px">
								<table class="table table-bordered">
									<thead>
										<tr class="success" align="center" style="color:#1DDB16">
											<th style="text-align:center;font-size:14px">일일정산날짜</th>
											<th style="text-align:center;font-size:14px">일일판매금액</th>
											<th style="text-align:center;font-size:14px">일일순이익</th>
											<th style="text-align:center;font-size:14px">입고도서번호</th>
											<th style="text-align:center;font-size:14px">입고도서제목</th>
											<th style="text-align:center;font-size:14px">입고량</th>
											<th style="text-align:center;font-size:14px">입고개당가격</th>
											<th style="text-align:center;font-size:14px">입고총액</th>
										</tr>
									</thead>
									<tbody id="listAllTd"></tbody>
								</table>
							</div>
							<div style="width:835px;font-size:14px; padding-bottom:25px; border-bottom:2px solid #DDDDDD; margin-left:100px">월별매출 내역이 없습니다.</div>
						</c:if>
						
						<c:if test="${count > 0}">
							<div class="container" style="width:835px;padding:0px">
								<table class="table table-bordered" style="line-height: 100px;margin-left:50px;">
									<thead>
										<tr class="success" align="center" style="color:#1DDB16">
											<th style="text-align:center;font-size:14px">일일정산날짜</th>
											<th style="text-align:center;font-size:14px">일일판매금액</th>
											<th style="text-align:center;font-size:14px">일일순이익</th>
											<th style="text-align:center;font-size:14px">입고도서번호</th>
											<th style="text-align:center;font-size:14px">입고도서제목</th>
											<th style="text-align:center;font-size:14px">입고량</th>
											<th style="text-align:center;font-size:14px">입고개당가격</th>
											<th style="text-align:center;font-size:14px">입고총액</th>
										</tr>
									</thead>
									<tbody id="listAllTd">
									<c:set var="monthlySum" value="0"/>
									<c:set var="monthlyProfit" value="0"/>
									<c:set var="monthlyOrderSum" value="0"/>
										<c:forEach var="salesMonthly_total" items="${salesMonthlyList}">
											<c:set var="monthlySum" value="${monthlySum+salesMonthly_total.salesmonthly_daily_sale}"/>
											<c:set var="monthlyProfit" value="${monthlyProfit+salesMonthly_total.salesmonthly_daily_profit}"/>
											<c:set var="monthlyOrderSum" value="${monthlyOrderSum+salesMonthly_total.salesmonthly_order_totalprice}"/>
										</c:forEach>
										
										<c:forEach var="salesMonthly" items="${salesMonthlyList}">
											<tr class="success" id="${salesMonthly.salesm_num}">
												<td style="text-align:center;font-size:14px"><fmt:formatDate value="${salesMonthly.salesmonthly_date}" type="both" pattern="yyyy/MM/dd"/></td>
												<td style="text-align:right;font-size:14px"><fmt:formatNumber value="${salesMonthly.salesmonthly_daily_sale}" groupingUsed="true"/>원</td>
												<td style="text-align:right;font-size:14px"><fmt:formatNumber value="${salesMonthly.salesmonthly_daily_profit}" groupingUsed="true"/>원</td>
												<td style="font-size:14px">${salesMonthly.book_num}</td>
												<td style="font-size:14px">
													<c:choose>
														<c:when test="${fn:length(salesMonthly.salesmonthly_order_bookname) > 10}">
															<c:out value="${fn:substring(salesMonthly.salesmonthly_order_bookname, 0, 9)}"/>....
														</c:when>
														<c:otherwise>
															${salesMonthly.salesmonthly_order_bookname}
														</c:otherwise>
													</c:choose>
												</td>
												<td style="text-align:center;font-size:14px">${salesMonthly.salesmonthly_order_quantity}</td>
												<td style="text-align:right;font-size:14px"><fmt:formatNumber value="${salesMonthly.salesmonthly_order_cost}" groupingUsed="true"/>원</td>
												<td style="text-align:right;font-size:14px"><fmt:formatNumber value="${salesMonthly.salesmonthly_order_totalprice}" groupingUsed="true"/>원</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							
							<div align="right" id="order" style="width:900px">
								<div id="monthly_sum" style="font-size: 18px"><b>월 판매 총액 : <fmt:formatNumber value="${monthlySum}" groupingUsed="true"/> 원</b></div><br/><br/>
								<div id="daily_profit_sum" style="height:30px;font-size: 18px"><b>일일 순이익 합계 : <fmt:formatNumber value="${monthlyProfit}" groupingUsed="true"/> 원</b></div>
								<div id="monthly_order_sum" style="width:300px;height:40px;font-size: 18px;border-bottom:2px solid black"><b>월 입고 총액 : <fmt:formatNumber value="${monthlyOrderSum}" groupingUsed="true"/> 원</b></div>
								<div id="monthly_profit" style="height:40px;line-height:40px;font-size: 18px"><b>월 순이익 : 
								<c:if test="${monthlyProfit-monthlyOrderSum >= 0}">
									<span style="color:blue;">
										<fmt:formatNumber value="${monthlyProfit-monthlyOrderSum}" groupingUsed="true"/>
									</span>
								</c:if>
								<c:if test="${monthlyProfit-monthlyOrderSum < 0}">
									<span style="color:red;">
										<fmt:formatNumber value="${monthlyProfit-monthlyOrderSum}" groupingUsed="true"/>
									</span>
								</c:if>
								원</b></div>
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