document.addEventListener("DOMContentLoaded", () => {
	const form = document.forms.chgPW;
	const btn = document.querySelector("#btn");
	btn.addEventListener('click', () => {
		if(form.nPW.value === '') {
			alert("비밀번호를 입력하세요.");
			form.nPW.focus();
			return;
		}
		else if(form.cPW.value === '') {
			alert("비밀번호를 확인해주세요.");
			form.cPW.focus();
			return;
		}
		else if(form.nPW.value !== form.cPW.value) {
			alert("비밀번호가 다릅니다.");
			form.cPW.focus();
			return;
		}
		else{
			form.action = "./actions/chgPWAction.jsp";
			form.submit();
		}
	});
});