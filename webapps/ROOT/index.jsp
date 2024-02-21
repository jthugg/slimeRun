<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Locale"%>
<%
	Locale locale = request.getLocale();
	String lang = locale.getLanguage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Redirecting...</title>
</head>
<body>
	<%response.sendRedirect("ko/main.jsp");%>
</body>
</html>