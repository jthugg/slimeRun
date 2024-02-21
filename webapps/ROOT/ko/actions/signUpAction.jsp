<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>Redirecting...</title>
<%@ include file="../../others/DBConn.jsp"%>
<%
	String sID = (String) session.getAttribute("sID");
	if(sID != null) {
		out.println("<script>");
		out.println("alert('잘못된 접근입니다.')");
		out.println("location.href='../main.jsp'");
		out.println("</script>");
	}
	
	request.setCharacterEncoding("utf-8");

	String uID = request.getParameter("uID");
	String uPW = request.getParameter("uPW");
	String sql = "INSERT INTO users(uID, uPW, signUpDate, uType) VALUES (?, ?, now(), 'u')";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, uID);
	pstmt.setString(2, uPW);
	rs = pstmt.executeQuery();

	if(rs!=null) rs.close();
	if(pstmt!=null) pstmt.close();
	if(conn!=null) conn.close();
	
	out.println("<script>");
	out.println("location.href='../main.jsp'");
	out.println("</script>");
%>