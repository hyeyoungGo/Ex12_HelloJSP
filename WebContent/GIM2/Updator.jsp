<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String code = request.getParameter("code");
	String item = request.getParameter("item");
	String company = request.getParameter("company");
	String price = request.getParameter("price");
	if(code == null || item == null || company == null || price == null) {
		throw new Exception("데이터가 누락되었습니다.");
	}
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch(Exception e) {}
	
%>