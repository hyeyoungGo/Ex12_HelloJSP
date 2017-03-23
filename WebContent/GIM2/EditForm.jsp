<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 정보 조회</title>
</head>
<body>
	<h2>상품을 수정해주세요</h2>
		<form action = "Updator.jsp" method="post">
			코드 : <input type="text" name="code"><p>
			상품명 : <input type ="text" name ="item"><p>
			회사명 : <input type = "text" name="company"><p>
			가격 : <input type = "text" name ="price"	><p>
			<input type="submit" value="확인">
			<input type="reset" value="취소">
		</form>
</body>
</html>