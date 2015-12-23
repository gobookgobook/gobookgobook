
function selectToServer(salesdaily_date, root){
	if(salesdaily_date==""){
		alert("날짜를 선택해주세요");
		return false;
	}
	
	if(salesdaily_date=="클릭 시 날짜 선택"){
		alert("날짜를 선택해주세요");
		return false;
	}
	
	var url=root+"/sales/salesDailyList.do?salesdaily_date="+salesdaily_date;
	//alert(url);
	location.href=url;
	
	/*$.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function(data){
			// alert(data);
			$("#clickDate").click(function(){
				$("#dailyTable").show();
			});
		},
		error:function(xhr, status, errorMsg){
			alert(status + "," + errorMsg);
		}
	});*/
}

function salesMonthlyInsert(daily_sum, daily_profit, salesmonthly_date, root){
	// alert(salesmonthly_date);
	var url=root+"/sales/salesMonthlyInsert.do?daily_sum="+daily_sum+"&daily_profit="+daily_profit+"&salesmonthly_date="+salesmonthly_date;
	//alert(url);
	
	location.href=url;
}