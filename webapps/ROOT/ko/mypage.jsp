<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../others/DBConn.jsp"%>
<%
	String sID = (String) session.getAttribute("sID");
	if(sID == null) {
		out.println("<script>");
		out.println("alert(\"invalid access.\")");
		out.println("location.href=\"main.jsp\"");
		out.println("</script>");
		return;
	}
	String uID = sID;

	request.setCharacterEncoding("utf-8");
	String sql = "SELECT highScore, scoredDate FROM users WHERE uID=?";

	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, uID);
	rs = pstmt.executeQuery();

	String hScr = "";
	String sDate = "";
	
	while(rs.next()) {
		hScr = rs.getString("highScore");
		sDate = rs.getString("scoredDate");
	}
	if(rs!=null) rs.close();
	if(pstmt!=null) pstmt.close();
	if(conn!=null) conn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::마이페이지::</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Jua&family=Luckiest+Guy&display=swap">
<link rel="icon" href="./Game/img/run1.png">
</head>
<style><%@ include file="./css/cssMypage.css"%></style>
<body>
	<%@ include file="../others/header.jsp" %>
	<!-- 메인 박스 -->
	<div class="login-box">
		<h3>마이페이지</h3><br>
		<p>최고점수<h2><%=hScr%></h2>
		<h3><%=sDate%></h3><br>
		<a class="w-btn w-btn-indigo" href="chgPW.jsp">비밀번호 변경</a>
	</div>
</body>
</html>