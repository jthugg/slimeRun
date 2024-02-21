<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String sID = (String) session.getAttribute("sID");
%>
<html>
<head>
<meta charset="UTF-8">
<title>::Main::</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Jua&family=Luckiest+Guy&display=swap">
<link rel="icon" href="./Game/img/run1.png">
</head>
<style><%@ include file="./css/cssMain.css"%></style>
<body>
	<%@ include file="../others/header.jsp" %>
	<!-- 메인 박스 -->
	<div class="login-box">
		<%
			if(sID == null) {
		%>
				<h3>환영합니다!</h3>
				<!-- 움직이는 그림 -->
					<div class="App">
  						 <canvas id="logo" class="logo" width="300" height=300></canvas>
  					</div>
				<a  class="w-btn w-btn-indigo"href="chkID.jsp" style="margin-right:10px">회원가입</a>
				<a  class="w-btn w-btn-indigo"href="login.jsp" style="margin-left:10px">로그인</a>
		<%
			}
			else {
		%>
				<h3><%=sID%> 님 환영합니다!</h3>
				<!-- 움직이는 그림 -->
				<div class="App">
 					<canvas id="logo" class="logo" width="300" height=300></canvas>
				</div>
				<a class="w-btn w-btn-indigo" href="mypage.jsp" style="margin-right:10px">마이페이지</a>
				<a class="w-btn w-btn-indigo" href="logout.jsp" style="margin-left:10px">로그아웃</a>
		<%
			}
		%>
		
		<form method="post" name="frmPlay" action="./actions/playAction.jsp">
			<button class="w-btn w-btn-indigo" id="btn" onclick="start()">게임시작</button>
			<input value="<%=sID%>" hidden="hidden">
		</form>
		<a class="w-btn w-btn-indigo" href="rnkBrd.jsp">랭킹보드</a>
		<script src="js/logo.js"></script>
	</div>
</body>
</html>