document.addEventListener("DOMContentLoaded", () => {
	const form = document.forms.chkID;
	const btn = document.querySelector("#chkID");
	btn.addEventListener('click', () => {
		if(form.uID.value === '') {
			alert("사용할 아이디를 입력해주세요.");
			form.uID.focus();
			return;
		}
		form.action = "./actions/chkIDAction.jsp";
		form.submit();
	});
});