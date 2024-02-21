document.addEventListener("DOMContentLoaded",() => {
	const form = document.forms.login;
	const btn = document.querySelector("#btn");
	btn.addEventListener('click',() => {
		if(form.uID.value === ''){
			alert("아이디를 입력해주세요.")
			form.uID.focus();
			return;
		}
		else if(form.uPW.value === ''){
			alert("비밀번호를 입력해주세요.");
			form.uPW.focus();
			return;
		}
		else {
			form.action = "./actions/loginAction.jsp";
			form.submit();
		}
	})
})