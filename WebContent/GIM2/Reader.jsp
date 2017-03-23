<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String code = request.getParameter("code");
	if(code == null) {
		throw new Exception("상품 코드가 없습니다.");
	}
	Connection conn =null;
	Statement stmt = null;
	ResultSet rs = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketdb", "root", "1234");
		if(conn==null) {
			throw new Exception("데이터베이스를 연결할수 없습니다.");
		}
		stmt = conn.createStatement();
		rs = stmt.executeQuery("select * from marketinfo where code = '"+ code + "';");
		if(!rs.next()) {
			throw new Exception("해당 데이터("+ code +")가 없습니다.");
		}
		String item = rs.getString("item");
		String company = rs.getString("company");
		int price = rs.getInt("price");
		request.setAttribute("code", code);
		request.setAttribute("item", item);
		request.setAttribute("company", company);
		request.setAttribute("price", new Integer(price));
	} finally {
		try {
			rs.close();
		} catch(Exception e) {}
		try {
			stmt.close();
		} catch(Exception e) {}
		try {
			conn.close();
		} catch(Exception e) {}
	}
	RequestDispatcher dispatcher = request.getRequestDispatcher("EditForm.jsp");
	dispatcher.forward(request, response);
%>
<!-- select * from marketinfo where code = '10001'; -->