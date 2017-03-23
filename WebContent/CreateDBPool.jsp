<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    	Connection conn = null;
    	try {
    		Context init = new InitialContext();
    		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
    		conn = ds.getConnection();
    		out.println("<h2>데이터에 연결되었습니다.</h2>");
    	} catch(Exception e) {
    		out.println("<h2>연결에 실패했습니다.</h2>");
    	}
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>데이터베이스 커넥션 풀 생성하기</title>
</head>
<body>
	<h3>데이터베이스 커넥션 풀 생성하기</h3>
	데이터베이스 커넥션 풀을 생성하고 등록했습니다.<p>
	풀 이름 :  /webdb_pool
</body>
</html>