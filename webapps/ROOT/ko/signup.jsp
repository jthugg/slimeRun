<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String sID = (String) session.getAttribute("sID");
	String uID = request.getParameter("uID");
	if(sID != null || request.getParameter("uID") == null) {
		out.println("<script>");
		out.println("alert('invalid access.')");
		out.println("location.href='main.jsp'");
		out.println("</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::Sign Up - Sign Up::</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Jua&family=Luckiest+Guy&display=swap">
<link rel="icon" href="./Game/img/run1.png">
</head>
<script type="text/javascript" charset="utf-8" src="./js/chkSignUp.js"></script>
<style><%@ include file="./css/cssSignUp.css"%></style>
<body>
	<%@ include file="../others/header.jsp" %>
	<!-- 메인 박스 -->
 	<div class="login-box">
		<h3>회원가입</h3><br>
		<form method="post" name="signup">
			<p><input class="form-wrapper__input" placeholder="아이디" type="text" name="uID" value="<%=uID%>" disabled>
			<input type="text" name="uID" value="<%=uID%>" hidden="hidden"><br><br>
			<p><input class="form-wrapper__input" placeholder="비밀번호" type="password" name="uPW" maxlength="20"><br><br>
			<p><input class="form-wrapper__input" placeholder="비밀번호 확인" type="password" name="cPW" maxlength="20"><br><br>
			<input hidden="hidden">
			<p><input class="w-btn w-btn-indigo" type="button" value="회원가입" id="btn">
		</form>
	</div>
</body>
</html>