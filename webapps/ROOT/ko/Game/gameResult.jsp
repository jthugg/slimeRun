<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../others/DBConn.jsp" %>
<%
	String sID = (String) session.getAttribute("sID");
	int nSC = request.getParameter("nSC") == null ? 0 : Integer.parseInt(request.getParameter("nSC"));
	int hs = request.getParameter("HS") == null ? 0 : Integer.parseInt(request.getParameter("HS"));
	if(sID == null) {
		out.println("<script>");
		out.println("alert('please login to Play')");
		out.println("location.href='../main.jsp'");
		out.println("</script>");
	}
	if(nSC == 0) {
		out.println("<script>");
		out.println("alert('invalid access')");
		out.println("window.history.back()");
		out.println("</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::게임오버::</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Jua&family=Luckiest+Guy&display=swap">
<link rel="icon" href="./img/run1.png">
</head>
<style><%@ include file="../css/cssGameResult.css"%></style>
<body>
	<%@ include file="../../others/header.jsp" %>

	<div class="login-box">
		<%
			if(nSC > hs) {
				hs = nSC;
				String sql = "UPDATE users SET highScore=?, scoredDate = now() WHERE uID=?";// update score
	
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, String.valueOf(hs));
				pstmt.setString(2, sID);
				rs = pstmt.executeQuery();
			}
		%>
		
		<h3>게임오버</h3><br>
		<h1 style="color:#0080FF"><%=nSC%></h1><br>
		<a class="w-btn w-btn-indigo" href="./slimeRun.jsp">다시하기</a>
		<a class="w-btn w-btn-indigo" href="../main.jsp">메인으로</a>
		<a class="w-btn w-btn-indigo" href="../rnkBrd.jsp">랭킹보드</a>
	</div>
</body>
</html>







