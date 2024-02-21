document.addEventListener("DOMContentLoaded", () => {
	const form = document.forms.signup;
	const btn = document.querySelector("#btn");
	btn.addEventListener('click', () => {
		if(form.uPW.value === '') {
			alert("비밃번호를 입력해주세요.");
			form.uPW.focus();
			return;
		}
		else if(form.cPW.value === '') {
			alert("비밀번호를 확인해주세요.");
			form.cPW.focus();
			return;
		}
		else if(form.uPW.value !== form.cPW.value) {
			alert("비밀번호가 다릅니다.");
			form.cPW.focus();
			return;
		}
		else{
			form.action = "./actions/signUpAction.jsp";
			form.submit();
		}
	});
});