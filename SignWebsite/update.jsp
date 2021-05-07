<%@ page language="java" contentType="text/html;
charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 비밀번호 입력</title>
</head>
<body>
<form action="updatepro.jsp" method="post">
아이디 : <input type="text" name="id"><br/>
비밀번호 : <input type="password" name="pw"><br/>
<input type="submit" value="변경"><br/>
<a href="index.jsp">취소</a>
</form>
</body>
</html>