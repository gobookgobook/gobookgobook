/**
 * 
 */

function eventForm(form){
	// alert("ok");
	if(form.event_start_period.value > form.event_end_period.value){
		alert("날짜를 다시 선택해주세요");
		form.event_start_period.focus();
		return false;
	}
}