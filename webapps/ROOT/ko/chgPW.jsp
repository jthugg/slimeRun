<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String sID = (String) session.getAttribute("sID");
	if(sID == null) {
		out.println("<script>");
		out.println("alert('invalid access')");
		out.println("location.href='main.jsp'");
		out.println("</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::마이페이지 : 비밀번호 변경::</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Jua&family=Luckiest+Guy&display=swap">
<link rel="icon" href="./Game/img/run1.png">
</head>
<script type="text/javascript" charset="utf-8" src="./js/chgPW.js"></script>
<style><%@ include file="./css/cssChgPW.css"%></style>
<body>
	<%@ include file="../others/header.jsp" %>
	<!-- 메인 박스 -->
		<div class="login-box">
			<h3>비밀번호 변경</h3>
			<form method="post" name="chgPW"><br>
				<p><%=sID%><input value="<%=sID%>" name="uID" hidden="hidden"><br><br>
				<p><input class="form-wrapper__input" placeholder="새 비밀번호" type="password" name="nPW" maxlength="20"><br><br>
				<p><input class="form-wrapper__input" placeholder="새 비밀번호 확인" type="password" name="cPW" maxlength="20"><br>
				<p><input class="w-btn w-btn-indigo" type="button" value="비밀번호 변경" id="btn">
			</form>
		</div>
</body>
</html>