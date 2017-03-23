<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.ConnectionEvent"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String code = request.getParameter("code");
	if(code == null) {
		throw new Exception ("상품 코드를 입력하세요.");
	}
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "1234");
		if(conn == null) {
			throw new Exception("데이터베이스를 연결할 수 없습니다.");
		}
		stmt = conn.createStatement();
		rs = stmt.executeQuery("select * from goodsinfo where code = '" +  code + "';");
		if(!rs.next()) {
			throw new Exception("상품코드(" + code + ")에 해당하는 데이터가 없습니다.");
		}
		String title = rs.getString("title");
		String writer = rs.getString("writer");
		int price = rs.getInt("price");
		request.setAttribute("CODE", code);
		request.setAttribute("TITLE", title);
		request.setAttribute("WRITER", writer);
		request.setAttribute("PRICE", new Integer(price));
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
<!-- select * from goodsinfo where code = '10001'; -->