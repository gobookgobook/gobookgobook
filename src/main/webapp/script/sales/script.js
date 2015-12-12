
function selectToServer(salesdaily_date, root){
	var url=root+"/sales/salesDailyList.do?salesdaily_date="+salesdaily_date;
	alert(url);
	location.href=url;
}