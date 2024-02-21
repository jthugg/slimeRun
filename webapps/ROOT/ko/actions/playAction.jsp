<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>Redirecting...</title>
<%
	String sID = (String) session.getAttribute("sID");
	if(sID == null) {
		out.println("<script>");
		out.println("alert('로그인이 필요한 서비스입니다.')");
		out.println("location.href='../main.jsp'");
		out.println("</script>");
	}
	else {
		out.println("<script>");
		out.println("location.href='../Game/instruction.jsp'");
		out.println("</script>");
	}
%>
