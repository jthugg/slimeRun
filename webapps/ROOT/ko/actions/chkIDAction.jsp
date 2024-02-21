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

	String sql = "SELECT uID FROM users WHERE uID=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, uID);
	rs = pstmt.executeQuery();
	
	if(rs.next()) {
		out.println("<script>");
		out.println("alert('" + uID + " 는 이미 사용중인 아이디 입니다.')");
		out.println("window.history.back()");
		out.println("</script>");
	}
	else {
		request.setAttribute("uID", uID);
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
		out.println("<script>");
		out.println("location.href='../signup.jsp?uID=" + uID + "'");
		out.println("</script>");
	}
%>