<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../others/DBConn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::Rank Board::</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Jua&family=Luckiest+Guy&display=swap">
<link rel="icon" href="./Game/img/run1.png">
</head>
<style><%@ include file="./css/cssrnkBrd.css"%></style>
<body>
	<%@ include file="../others/header.jsp" %>
	<!-- 메인 박스 -->
	<div class="login-box">
		<h3>랭킹보드</h3><br>
			<%
				out.println("<table style='font-size: 25px'>");
				out.println("<th>");
				out.println("랭킹");
				out.println("</th>");
				out.println("<th>");
				out.println("아이디");
				out.println("</th>");
				out.println("<th>");
				out.println("점수");
				out.println("</th>");
				out.println("<th>");
				out.println("갱신 날짜");
				out.println("</th>");
				for(int i = 0; i < 100; i++) {
					request.setCharacterEncoding("utf-8");
					String sql = "SELECT highScore, uID, scoredDate FROM users ORDER BY highScore DESC LIMIT " + i + ", 1";
				
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
				
					String uID = "";
					String scr = "";
					String date = "";
					
					while(rs.next()) {
						uID = rs.getString("uID");
						scr = rs.getString("highScore");
						date = rs.getString("scoredDate");
					}
					if(uID.equals("")) break;
					if(scr == null) ;
					else {
						out.println("<tr>");
						out.println("<td>");
						out.println(i + 1);
						out.println("</td>");
						out.println("<td>");
						out.println(uID);
						out.println("</td>");;
						out.println("<td>");
						out.println(scr);
						out.println("</td>");;
						out.println("<td>");
						out.println(date);
						out.println("</td>");
						out.println("</tr>");
					}
				}
				out.println("</table>");
			%>
	</div>
</body>
</html>