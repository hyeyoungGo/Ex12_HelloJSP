<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String code = request.getParameter("CODE");
	Connection conn = null;
	Statement stmt = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketdb", "root", "1234");
		if(conn == null) {
			throw new Exception("MarketDB 데이터베이스에 연결이 되지 않습니다.");
		}
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from marketinfo where code = '" + code  + "';");
		if(rs.next()) {
			String item = rs.getString("ITEM");
			String company = rs.getString("COMPANY");
			int price = rs.getInt("PRICE");
			request.setAttribute("ITEM", item);
			request.setAttribute("COMPANY", company);
			request.setAttribute("PRICE", price);
			request.setAttribute("CODE", code);
		} 
	}finally {
			try {
				stmt.close();
			} catch(Exception e) {}
				try {
					conn.close();
				}catch(Exception e) {}
	}
		RequestDispatcher dispatcher = request.getRequestDispatcher("MarketInfoViewer.jsp");
		dispatcher.forward(request, response);
%>