<%@ page language="java" contentType="text/html;
charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴하시겠습니까?</title>
</head>
<body>
<form action="MemberDeletePro.jsp" method="post">
<table>
<tr> 
<td colspan="2">정말로 탈퇴하시겠습니까?
</td>

<tr>
<td>아이디 : </td>
<td><input type="text" name="id"></td>
</tr>

<tr>
<td>비밀번호 : </td>
<td><input type="password" name="pw"></td>
</tr>

<tr>
<td></td>
<td><input type="submit" value="탈퇴"> <input type="button" onClick="location.href='index.jsp'" value="취소"></td>
</tr>

</table>
</form>
</body>
</html>