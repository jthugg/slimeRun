<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String sID = (String) session.getAttribute("sID");
	if(sID == null) {
		out.println("<script>");
		out.println("alert('please login to Play')");
		out.println("location.href='../main.jsp'");
		out.println("</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::게임 안내::</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Jua&family=Luckiest+Guy&display=swap">
<link rel="icon" href="./img/run1.png">
</head>
<style><%@ include file="../css/cssInstrt.css"%></style>
<script type="text/javascript" src="../js/chkInstrt.js"></script>
<body>
	<%@ include file="../../others/header.jsp" %>
	<!-- 메인 박스 -->
	<div class="login-box">
		<div id="wrap">
			<div class="btn">
				<button class="w-btn w-btn-indigo" onclick="location.href='./slimeRun.jsp'">게임시작</button>
			</div>
			<div class="btn">
				<p><button class="w-btn w-btn-indigo" onclick="instruction()">조작법</button><br>
				<p id="instrt" style="display: none;">
					<br>
					스페이스 바, W : 점프
					<br><br>
					아래 방향키, S : 슬라이드
				</p>
			</div>
		</div>
	</div>
</body>
</html>