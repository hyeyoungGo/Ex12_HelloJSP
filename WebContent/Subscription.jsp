<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		if(name == null || id == null||pw == null) {
			throw new Exception("데이터를 입력하세요.");
		}
		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "1234");
			if(conn == null) {
				throw new Exception("데이터를 연결할 수 없습니다.");
			}
			stmt = conn.createStatement();
			String command = String.format("insert into userinfo" + "(name, id, password) values('%s', '%s', '%s');", name, id, pw);
			int rowNum = stmt.executeUpdate(command);
			if(rowNum < 1) {
				throw new Exception("데이터를 DB에 입력할 수 없습니다.");
			}
		} finally {
			try {
				stmt.close();
			} catch(Exception e) {}
			try {
				conn.close();
			} catch(Exception e) {}
		}
		response.sendRedirect("SubscriptionResult.jsp");
%>
<!-- out.println(name + "<p>");
		out.println(id + "<p>");
		out.println(pw + "<p>");  -->
		<!-- "insert into userinfo (name, id, password) values('asd', 'sdf', 'qrr'); -->