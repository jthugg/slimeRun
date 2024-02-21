<%@ page import="java.sql.*" %>

<%	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String url ="jdbc:mariadb://host.docker.internal:3306/slime";
	String user = "root";
	String pw = "test";
	
	Class.forName("org.mariadb.jdbc.Driver");
	conn = DriverManager.getConnection(url,user,pw);
%>