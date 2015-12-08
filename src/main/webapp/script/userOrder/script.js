/**
 * 
 */

/*function payToServer(root, order_bunho){
	
	var url=root + "/userOrder/userOrderList.do?order_bunho="+order_bunho;
	//alert(url);
	$.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function(data){
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
		},
		error:function(xhr,status,errorMsg){
			alert(status + "," + errorMsg);
		}
	
	});
}*/