<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import= "java.sql.Connection"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String code = request.getParameter("code");
	Connection conn = null;
	Statement stmt = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "1234");
		if(conn == null) {
			throw new Exception("데이터베이스에 연결할 수 없습니다. <p>");
		}
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from goodsinfo where code = '" + code + "';");
		if(rs.next()) {
			String title = rs.getString("title");
			String writer = rs.getString("writer");
			int price = rs.getInt("price");
			request.setAttribute("CODE", code);
			request.setAttribute("TITLE", title);
			request.setAttribute("WRITER", writer);
			request.setAttribute("PRICE", price);
		} else {
			out.println("webDB - rs.next() - Not");
		}
	} finally {
		try {
			stmt.close();
		} catch(Exception e) {}
			try {
				conn.close();
			} catch(Exception e) {}
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("GoodsInfoViewer.jsp");
		dispatcher.forward(request, response);
	
%>