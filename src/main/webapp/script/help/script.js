function adminHelpNoticeWrite(form){
	if(form.helpnotice_subject.value==""){
		alert("공지사항 제목을 입력해야 합니다.");
		form.helpnotice_subject.focus();
		return false;
	}
	
	if(form.helpnotice_content.value==""){
		alert("공지사항 내용을 입력해야 합니다.");
		form.helpnotice_content.focus();
		return false;
	}
}

function adminHelpQnAWrite(form){
	if(form.helpqna_subject.value==""){
		alert("Q&A 제목을 입력해야 합니다.");
		form.helpqna_subject.focus();
		return false;
	}
	
	if(form.helpqna_content.value==""){
		alert("Q&A 내용을 입력해야 합니다.");
		form.helpqna_content.focus();
		return false;
	}
}