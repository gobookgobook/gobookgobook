
function selectToServer(salesdaily_date, root){
	if(salesdaily_date==""){
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