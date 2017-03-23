<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body>
	<h2>회원 정보를 입력하세요</h2>
		<form action = "Subscription.jsp" method="post">
			이름 : <input type="text" name="name"	size= "10"	><p>
			아이디 : <input type="text" name="id" size = "12"> <p>
			패드워드 : <input type="password" name="pw" size="13"> <p>
			<input type = "submit" value="확인">
			<input type = "reset" value="취소">
		</form>
</body>
</html>