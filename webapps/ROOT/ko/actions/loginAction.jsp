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
	
	try {
		String sql = "SELECT uID, uPW FROM users WHERE uID=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, uID);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			String rID = rs.getString("uID");
			String rPW = rs.getString("uPW");
			
			if(rID.equals(uID) && rPW.equals(uPW)) {
				session.setAttribute("sID", uID);
				
		 		rs.close();
		 		pstmt.close();
				pstmt = null;
				rs = null;
				
				sql = "UPDATE users SET lastLogin=now() WHERE uID=?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, uID);
				rs = pstmt.executeQuery();
				
		 		rs.close();
		 		pstmt.close();
		 		conn.close();
				
				out.println("<script>");
				out.println("location.href='../main.jsp'");
				out.println("</script>");
			}
			else {
				out.println("<script>");
				out.println("alert('아이디 또는 비밀번호를 확인하세요.')");
				out.println("window.history.back()");
				out.println("</script>");
			}
		}
		else {
			out.println("<script>");
			out.println("alert('아이디 또는 비밀번호를 확인하세요.')");
			out.println("window.history.back()");
			out.println("</script>");
		}
	}
	catch(Exception e) {
		out.println("<script>");
		out.println("alert('아이디 또는 비밀번호를 확인하세요.')");
		out.println("window.history.back()");
		out.println("</script>");
	}
	finally {
 		if(rs!=null) rs.close();
 		if(pstmt!=null) pstmt.close();
 		if(conn!=null) conn.close();
	}
%>