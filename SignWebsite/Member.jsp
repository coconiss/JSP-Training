<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Insert title</title></head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<form action = "MemberPro.jsp" method="post">
<table>
<tr><td>ID : </td> <td> <input type="text" name="id"></td></tr>
<tr><td>Password : </td> <td> <input type="password" name="pw"></td></tr>
<tr><td>이름 : </td> <td> <input type="text" name="name"></td></tr>
<tr><td>닉네임 : </td> <td> <input type="text" name="nickname"></td></tr>
<tr><td>전화번호 : </td> <td> <input type="text" maxlength="3" name="ph1" style=width:70px;>-<input type="text" maxlength="4" name="ph2" style=width:70px;>-<input type="text" maxlength="4" name="ph3" style=width:70px;></td></tr>
</table>

<table border=1>

<tr> <td>자격증 보유 여부</td>
<td>
<input type="radio" name="M_Status" value="Y">보유
<input type="radio" name="M_Status" value="N">미보유
</td>
</tr>

<tr><td>소속국가</td>
<td>
<select name="country" size="3">
<option selected value="Korea">Korea</option>
<option value="USA">USA</option>
<option value="Japan">Japan</option></select>
</td>
</tr>
</table>
<input type="reset" value="다시작성">
<input type="submit" value="입력완료">
</form>
</body>
</html>