<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
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
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "1234");
	if(connection != null) {
		out.println("Webdb 데이터베이스로 연결했습니다. <p>");
		connection.close();
		out.println("Webdb 데이터베이스로 연결을 끊었습니다. <p>");
	} else {
		out.println("Webdb 데이터베이스로 연결할 수 없습니다. <p>");
	}
%>
</body>
</html>