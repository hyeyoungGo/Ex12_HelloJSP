<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String code = request.getParameter("code");
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
		conn = ds.getConnection();
		if(conn == null) {
			throw new Exception("데이터베이스에 연결할수 없습니다.");
		}
		stmt = conn.createStatement();
		rs = stmt.executeQuery("select * from goodsinfo where code = '" + code + "';");
		if(rs.next()) {
			String title = rs.getString("title");
			String writer = rs.getString("writer");
			int price = rs.getInt("price");
			request.setAttribute("CODE", code);
			request.setAttribute("TITLE", title);
			request.setAttribute("WRITER", writer);
			request.setAttribute("PRICE", price);
		} else {
			out.println("rs-else");
		}
	} finally {
		try {
			rs.close();
		} catch (Exception e) {}
		try {
			stmt.close();
		} catch(Exception e) {}
		try {
			conn.close();
		} catch(Exception e) {}
	}
	RequestDispatcher dispatcher = request.getRequestDispatcher("NewGoodsInfoViewer.jsp");
	dispatcher.forward(request, response);
%>
<!-- select * from goodsinfo where code = '10001'; -->