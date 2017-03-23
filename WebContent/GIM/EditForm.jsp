<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 정보 관리</title>
</head>
<body>
	<h2>상품 정보를 수정 후 버튼을 누르시오</h2>
	<form action="Updator.jsp" method="post">
		<!-- Stirng code = request.getParameter(CODE); -->
		코드 : <input type= "text" name="code" value="${CODE }" readonly="readonly"><p>
		제목 : <input type= "text" name="title" value="${TITLE }"><p>
		작가 : <input type="text" name="writer"	value="${WRITER }"><p>
		가격 : <input type= "text" name="price" value="${PRICE }"><p>
		<input type="submit" value="확인">
		<input type="reset" value="취소">
	</form>
</body>
</html>