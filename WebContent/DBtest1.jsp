<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>데이터베이스로 연결하기</title>
</head>
<body>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "1234");
	if(conn != null) {
		out.println("webDB 데이터베이스로 연결했습니다. <p>");
		conn.close();
		out.println("webDB 데이터베이스로 연결을 끊었습니다. <p>");
	} else {
		out.println("webDB 데이터베이스로 연결할 수 없습니다. <p>");
	}
%>
</body>
</html>