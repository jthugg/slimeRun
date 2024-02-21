<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../others/DBConn.jsp" %>
<%
	String sID = (String) session.getAttribute("sID");
	if(sID == null) {
		out.println("<script>");
		out.println("alert('please login to Play')");
		out.println("location.href='../main.jsp'");
		out.println("</script>");
	}
	
	request.setCharacterEncoding("utf-8");
	
	String uID = sID;
	String sql = "SELECT highScore FROM users WHERE uID=?";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, uID);
	rs = pstmt.executeQuery();
	
	int hs = 0;
	if(rs.next()) hs = rs.getString("highScore") == null ? 0 : rs.getInt("highScore");
	
	if(rs!=null) rs.close();
	if(pstmt!=null) pstmt.close();
	if(conn!=null) conn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Slime Run</title>
<link rel="icon" href="./img/run1.png">
</head>
<style>
	*{
		margin:0;
		padding: 0;
		box-sizing: border-box;
	}
	canvas{
		display: block;
	}
</style>
<link rel="shortcut icon" href="#">
<body>
	<canvas id="game"></canvas>
	<form name="score" method="post" action="gameResult.jsp">
		<input type="hidden" name="HS" value="<%=hs%>">
		<input type="hidden" name="nSC">
	</form>
	<script type="text/javascript" src="slimeRun.js"></script>
</body>
</html>






