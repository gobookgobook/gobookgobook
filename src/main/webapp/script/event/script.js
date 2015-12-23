/**
 * 
 */

function eventForm(form){
	// alert("ok");
	
	var start_period=form.start_period.value;
	form.event_start_period.value=start_period;
	
	var end_period=form.end_period.value;
	form.event_end_period.value=end_period;
	
	if(form.event_start_period.value > form.event_end_period.value){
		alert("날짜를 다시 선택해주세요");
		form.event_start_period.focus();
		return false;
	}
	
	if(form.event_name.value ==""){
		alert("이벤트 이름을 입력해주세요.");
		form.event_name.focus();
		return false;
	}
	
	if(form.event_start_period.value ==""){
		alert("시작 날짜를 선택해주세요.");
		form.event_start_period.focus();
		return false;
	}
	
	if(form.event_Content.value ==""){
		alert("이벤트 내용을 작성해주세요.");
		form.event_Content.focus();
		return false;
	}
	
	if(form.event_file.value ==""){
		alert("이벤트 사진을 넣어주세요.");
		form.event_file.focus();
		return false;		
	}
	
}

