<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String sID = (String) session.getAttribute("sID");
	if(sID != null) {
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
<title>::회원가입 : 아이디 체크::</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Jua&family=Luckiest+Guy&display=swap">
<link rel="icon" href="./Game/img/run1.png">
</head>
<script type="text/javascript" charset="utf-8" src="./js/chkID.js"></script>
<style><%@ include file="./css/cssSignUp.css"%></style>
<body>
	<%@ include file="../others/header.jsp" %>
	<!-- 메인 박스 -->
 	<div class="login-box">
		<h3>아이디 중복체크</h3><br>
		<form method="post" name="chkID">
			<p><input class="form-wrapper__input" placeholder="아이디" type="text" name="uID" maxlength="12">
			<input hidden="hidden"><br><br>
			<p><input class="w-btn w-btn-indigo" type="button" value="중복체크" id="chkID">
		</form>
	</div>
</body>
</html>