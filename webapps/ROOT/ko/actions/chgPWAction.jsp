<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>Redirecting...</title>
<%@ include file="../../others/DBConn.jsp"%>
<%
	String sID = (String) session.getAttribute("sID");
	if(sID == null) {
		out.println("<script>");
		out.println("alert('잘못된 접근입니다.')");
		out.println("location.href='../main.jsp'");
		out.println("</script>");
	}
	
	request.setCharacterEncoding("utf-8");

	String uID = request.getParameter("uID");
	String nPW = request.getParameter("nPW");
	String sql = "SELECT uPW FROM users WHERE uID=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, uID);
	rs = pstmt.executeQuery();
	if(rs.next()) {
		String rPW = rs.getString("uPW");
		if(nPW.equals(rPW)) {
			out.println("<script>");
			out.println("alert('현재 사용중인 비밀번호로는 바꿀 수 없습니다.')");
			out.println("window.history.back()");
			out.println("</script>");
		}
		else{
			sql = "UPDATE users SET uPW=? WHERE uID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nPW);
			pstmt.setString(2, uID);
			rs = pstmt.executeQuery();
			
	 		if(rs!=null) rs.close();
	 		if(pstmt!=null) pstmt.close();
	 		if(conn!=null) conn.close();

			out.println("<script>");
			out.println("alert('비밀번호가 변경되었습니다.')");
			out.println("location.href='../mypage.jsp'");
			out.println("</script>");
		}
	}
%>